# Platform Engineer Assignment

This repository contains my solution for the Platform Engineer take-home assignment.

## Overview

The assignment focuses on building foundational components for Vulnerability and Patch Management (VPM) automation using Terraform. The solution includes:

* A reusable Terraform module for provisioning EC2 instances
* A Terraform-based AMI drift detection configuration
* Written responses to platform engineering design questions

## Repository Structure

```text
platform-engineer-assignment/
├── README.md
├── ANSWERS.md
│
├── modules/
│   └── ec2-instance/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── README.md
│
└── drift-detection/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── terraform.tfvars.example
```


## Task 1 – Reusable EC2 Module

The `modules/ec2-instance` module provisions an AWS EC2 instance and supports:

* Configurable instance type
* Configurable AMI ID
* Environment validation (`dev`, `staging`, `prod`)
* Standardized resource tagging
* Outputs for instance ID and private IP address

## Task 2 – AMI Drift Detection

The `drift-detection` configuration compares:

* Current AMI ID
* Approved AMI ID

It produces:

* A boolean drift detection result
* A human-readable drift status message

This can be integrated with CI/CD pipelines or policy enforcement workflows.

## Task 3 – Design Questions

Responses to the design questions are provided in `ANSWERS.md`.

Topics covered include:

* AMI compliance enforcement
* Risks of hardcoded AMI references
* CI/CD automation guardrails
* Policy-as-Code approaches

## Assumptions

* AWS is used as the target cloud platform.
* Terraform version 1.5 or later is available.
* Placeholder AMI IDs are used throughout the repository.
* No real AWS credentials, account IDs, or sensitive information are included.
* Networking resources such as VPCs, subnets, and security groups are assumed to exist and are outside the scope of this assignment.

## Validation

The configurations were validated using:
terraform init
terraform validate
terraform fmt -recursive


## Notes

The implementation prioritizes simplicity, readability, and reusability while following Terraform module best practices.
