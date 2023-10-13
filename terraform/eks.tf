# Cluster IAM Role

resource "aws_iam_role" "eks-iam-role" {
 name = var.cluster_name

 path = "/"

 assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
  {
   "Effect": "Allow",
   "Principal": {
    "Service": "eks.amazonaws.com"
   },
   "Action": "sts:AssumeRole"
  }
 ]
}
EOF

}

# Attach required policies

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
 policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
 role    = aws_iam_role.eks-iam-role.name
}
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
 policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
 role    = aws_iam_role.eks-iam-role.name
}

# Security Group
resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-sg"
  description = "Security group for EKS cluster"

  ingress {
    from_port = 5000
    to_port   = 5000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust this to allow traffic only from specific IP ranges if needed
  }
}

# EKS Cluster Creation

resource "aws_eks_cluster" "devopsthehardway-eks" {
 name = "devopsthehardway-cluster"
 role_arn = aws_iam_role.eks-iam-role.arn
 version = "1.25"

 vpc_config {
  subnet_ids = [var.subnet_id_1, var.subnet_id_2]
  security_group_ids = [aws_security_group.eks_cluster_sg.id]
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}



