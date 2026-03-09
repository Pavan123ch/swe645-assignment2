---

# SWE 645 – Kubernetes Deployment Project

## Student Information

**Name:** Surya Pavan Kumar Chilukuri
**Course:** SWE 645 – Software Engineering for Web Applications
**University:** George Mason University
**Semester:** Spring 2026

---

# Project Overview

This project demonstrates the deployment of a containerized web application using modern DevOps tools and cloud infrastructure.

The application is containerized using **Docker**, automated through a **Jenkins CI/CD pipeline**, and deployed to a **Kubernetes cluster running on AWS EC2**. Kubernetes manages multiple replicas of the application and exposes it externally through a NodePort service.

The project showcases key DevOps concepts including containerization, continuous integration, automated deployment, scalability, and fault tolerance.

---

# Technologies Used

* Docker
* DockerHub
* Kubernetes (k3s)
* Jenkins
* AWS EC2
* HTML / Bootstrap
* kubectl CLI

---

# Application Description

The application is a simple student survey website developed using HTML and Bootstrap. It consists of a homepage and a survey form that allows users to provide feedback.

The application files are packaged into a Docker container and served through a lightweight web server.

---

# System Architecture

```
User Browser
     ↓
AWS EC2 Instance
     ↓
Kubernetes Cluster (k3s)
     ↓
NodePort Service
     ↓
ReplicaSet
     ↓
3 Pods
     ↓
Docker Container
     ↓
Web Application
```

This architecture ensures scalability and reliability by running multiple instances of the application.

---

# Docker Containerization

The web application was containerized using Docker. The Dockerfile defines the instructions required to build the container image.

## Build Docker Image

```bash
docker build -t surya100599/swe645-survey:v1 .
```

## Push Docker Image to DockerHub

```bash
docker push surya100599/swe645-survey:v1
```

DockerHub Repository:

[https://hub.docker.com/r/surya100599/swe645-survey](https://hub.docker.com/r/surya100599/swe645-survey)

---

# Kubernetes Deployment

The application is deployed to Kubernetes using two configuration files:

```
deployment.yaml
service.yaml
```

## Deployment

The deployment creates **three replicas** of the application container.

```yaml
replicas: 3
image: surya100599/swe645-survey:v1
containerPort: 80
```

## Service

A **NodePort service** exposes the application externally.

```
nodePort: 30007
```

---

# Deployment Commands

## Apply Deployment

```bash
kubectl apply -f deployment.yaml
```

## Apply Service

```bash
kubectl apply -f service.yaml
```

## Verify Pods

```bash
kubectl get pods
```

## Verify Services

```bash
kubectl get svc
```

---

# CI/CD Pipeline

A Jenkins pipeline was implemented to automate the build and deployment process.

Pipeline stages include:

1. Pull source code
2. Build Docker image
3. Push Docker image to DockerHub
4. Deploy application to Kubernetes
5. Verify deployment

The pipeline is defined using a **Jenkinsfile**.

---

# Application Access

Once deployed, the application can be accessed using the public IP address of the AWS EC2 instance.

```
http://44.223.66.61:30007
```

---

# Kubernetes Self-Healing

Kubernetes automatically replaces failed pods to maintain the desired number of replicas.

Example command used for testing:

```bash
kubectl delete pod <pod-name>
```

A new pod is automatically created by Kubernetes.

---

# Project Structure

```
SWE645-Assignment2
│
├── src/
│   ├── index.html
│   ├── survey.html
│   └── Profile.jpg
│
├── docker/
│   └── Dockerfile
│
├── cicd/
│   └── Jenkinsfile
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── screenshots/
│
└── README.md
```

---

# Conclusion

This project demonstrates how Docker, Jenkins, Kubernetes, and AWS can be used together to build a scalable and automated application deployment pipeline.

Containerization ensures consistent application environments, Kubernetes provides orchestration and fault tolerance, and Jenkins automates the deployment workflow.

The implementation highlights modern DevOps practices used in real-world cloud-native application development.

---
