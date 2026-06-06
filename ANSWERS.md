# Q1. the platform team wants to enforce that no EC2 instance can be deployed using an AMI 
older than 30 days. Where in the Terraform workflow would you implement this check, and what tooling would you use?

I would enforce this policy during the CI/CD validation stage before any Terraform apply is allowed to run. The pipeline would retrieve metadata about the approved AMI, including its creation date, and compare it against the organization's 30-day compliance requirement.

For policy enforcement, I would use Open Policy Agent (OPA) or HashiCorp Sentinel to evaluate Terraform plans and prevent deployments that reference AMIs older than 30 days. This approach ensures non-compliant infrastructure is blocked before reaching production and provides consistent governance across all teams.

By enforcing the policy in the deployment pipeline rather than relying on manual reviews, compliance becomes automated, repeatable, and auditable.

# Q2.  A developer on an application team tells you they've hardcoded an AMI ID directly into their 
Terraform module instead of referencing the platform team's approved channel. What's the risk, 
and how would you address it both technically and through process? 

Hardcoding an AMI ID creates a significant risk because instances may continue to be deployed using outdated images that no longer contain the latest security patches or approved configurations. This can result in security vulnerabilities, compliance issues, and inconsistent environments across teams.

Technically, I would require application teams to consume AMIs through a platform-managed source such as a Terraform variable, parameter store entry, image catalog, or approved release channel. Policy checks using OPA or Sentinel could be implemented to detect and block hardcoded AMI references during code review or CI validation.

From a process perspective, I would establish platform standards, provide reusable modules, and include AMI compliance checks in pull request reviews. Clear documentation and developer education would help ensure teams understand why approved image channels must be used.


# Q3. You are asked to design a CI/CD pipeline step that automatically triggers a terraform apply 
when a new AMI version is promoted to the production channel. What are the risks of full 
automation here, and what guardrails would you put in place? 

Automatically applying infrastructure changes when a new AMI is promoted can improve patch compliance, but it also introduces risks. A faulty AMI could cause service outages, application incompatibilities, or large-scale deployment failures if rolled out across all environments simultaneously.

To reduce risk, I would implement several guardrails. First, all AMIs should pass automated testing and vulnerability scanning before promotion. Second, deployments should follow a staged rollout process, such as dev → staging → production. Third, production deployments should require approval gates or change-management controls for critical workloads.

I would also implement health checks, monitoring, and automated rollback procedures to quickly recover if issues are detected after deployment. For large environments, canary deployments can further reduce blast radius by validating the AMI on a small subset of instances before wider rollout.
