#!/bin/bash

# Set variables
CLUSTER_NAME="my-eks-cluster"
REGION="us-east-1"
NEW_VERSION="1.22"

# Function to check cluster status
check_cluster_status() {
    status=$(aws eks describe-cluster --name $CLUSTER_NAME --region $REGION --query 'cluster.status' --output text)
    echo $status
}

# Upgrade EKS control plane
echo "Upgrading EKS control plane..."
aws eks update-cluster-version --name $CLUSTER_NAME --region $REGION --kubernetes-version $NEW_VERSION

# Wait for upgrade to complete
echo "Waiting for control plane upgrade to complete..."
while [ "$(check_cluster_status)" != "ACTIVE" ]; do
    echo "Current status: $(check_cluster_status)"
    sleep 60
done

# Update kubeconfig
aws eks get-token --cluster-name $CLUSTER_NAME | kubectl apply -f -

# Upgrade node groups
echo "Upgrading managed node groups..."
for ng in $(aws eks list-nodegroups --cluster-name $CLUSTER_NAME --region $REGION --query 'nodegroups[]' --output text); do
    aws eks update-nodegroup-version --cluster-name $CLUSTER_NAME --nodegroup-name $ng --region $REGION
done

# Wait for node group upgrades to complete
echo "Waiting for node group upgrades to complete..."
aws eks wait nodegroup-active --cluster-name $CLUSTER_NAME --nodegroup-name $ng --region $REGION

# Update core add-ons
echo "Updating core add-ons..."
kubectl patch deployment coredns -n kube-system --type json -p='[{"op": "replace", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type", "value": "ec2"}]'
kubectl rollout restart -n kube-system deployment coredns
kubectl set env daemonset aws-node -n kube-system ENABLE_PREFIX_DELEGATION=true
kubectl patch daemonset kube-proxy -n kube-system --type json -p='[{"op": "replace", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type", "value": "ec2"}]'

echo "EKS cluster upgrade and maintenance complete!"
