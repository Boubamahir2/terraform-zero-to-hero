## Terraform Workspaces: A Quick Overview
Terraform workspaces help you manage multiple environments (dev, staging, prod) using the same Terraform configuration. They provide isolation and control over infrastructure changes in different environments.

## Key Concepts:
Isolated state: Each workspace has its own Terraform state, preventing accidental changes in one environment from affecting another.
Environment-specific configurations: You can use variables, data sources, and Terraform Cloud workspaces to configure resources differently for each environment.
Version control: Track and manage configurations for each workspace independently.

## Benefits:
Safe deployments: Test and deploy changes to non-production environments before pushing them to production.
Organized infrastructure: Manage configurations for different environments without duplication or confusion.
Collaboration: Team members can work on specific environments without interfering with others.

## Common Use Cases:
Developing, testing, and deploying applications across different environments.
Managing multiple infrastructure configurations for different customers or projects.
Implementing complex infrastructure with granular control over each environment.
Things to Consider:

Workspaces add complexity, so carefully evaluate their need before using them.
Implement clear naming conventions and access controls for workspaces.
Thoroughly test changes in non-production environments before deploying to production.

### terraform workspace
$ terraform workspace new prod

The command terraform workspace new prod will create a new Terraform workspace named "prod" in your current working directory. However, before executing it, there are some important things to consider:

## Best Practices:
Use clear and descriptive workspace names to distinguish between environments (e.g., dev, staging, prod).

$ terraform workspace -h 
The command terraform workspace -h will provide all the commandes availlable

$ terraform workspace select ${workspace name i.e dev, prod, stage}

### Example:
$ terraform workspace select dev
This will switch your Terraform working directory to the workspace named "dev".