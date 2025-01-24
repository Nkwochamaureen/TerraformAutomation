# TerraformAutomation
### Project Overview: Terraform Documentation Automation and Hosting
### Workflow Status
⚠️ Note: The workflows related to GCP are currently disabled due to the expiration of the GCP account. The workflows remain for reference purposes.

#### Objective:
Create a solution to automatically generate, update, and host Terraform documentation using a containerized approach on Google Cloud Platform (GCP). The solution should not store generated documentation within the codebase but should use a CI/CD pipeline to handle generation and deployment.

#### Requirements:

1. *Modularize Terraform Code*:
   - Organize your Terraform code into modules to improve readability and maintainability.

2. *Generate Static Files*:
   - Use Terraform to generate static files for documentation. Utilize tools like terraform-docs to automatically generate these files.

3. *Auto-detection of Changes*:
   - Implement an auto-detection mechanism to identify changes in Terraform code. Upon detecting changes, automatically regenerate the documentation.

4. *Containerize Documentation*:
   - Ensure that the generated documentation is containerized within the CI/CD pipeline.
   - Use Docker to build and package the documentation into a container.

5. *CI/CD Integration*:
   - Configure your CI/CD pipeline to:
     - Detect changes in the Terraform codebase.
     - Generate the updated documentation.
     - Containerize the generated documentation.
     - Deploy the container to GCP.

6. *Hosting on GCP*:
   - Host the containerized documentation on GCP.

7. *Load Balancer with HTTPS Redirect*:
   - Create a load balancer on GCP to route traffic to your web application hosting the Terraform documentation.
   - Configure the load balancer to enforce HTTPS redirects for secure access.

8. *URL Mapping*:
   - Add a URL map to the load balancer to serve the Terraform documentation at terraform.example.com.

#### Steps to Implement:

1. *Modularize Terraform Code*:
   - Refactor existing Terraform code into reusable modules.
   - Ensure each module is self-contained and properly documented.

2. *Setup Documentation Generation*:
   - Integrate terraform-docs or a similar tool in your CI/CD pipeline.
   - Ensure the tool runs on each code change to regenerate the documentation.

3. *Containerization*:
   - Create a Dockerfile to containerize the generated documentation.
   - Ensure the Dockerfile is part of the CI/CD pipeline, enabling automatic container builds.

4. *CI/CD Configuration*:
   - Use GitHub Actions, GitLab CI, or another CI/CD tool to automate the process.
   - Define stages for detecting changes, generating documentation, building the Docker container, and deploying it to GCP.

5. *Deploy to GCP*:
   - Use GCP service to deploy the containerized documentation.
   - Ensure proper network and security configurations are in place.

6. *Load Balancer and HTTPS*:
   - Create a load balancer on GCP.
   - Configure HTTPS and setup redirects to ensure secure traffic.
   - Add a URL map to route traffic to terraform.example.com.

#### Deliverables:

1. Modularized Terraform code.
2. Automated CI/CD pipeline for documentation generation and deployment.
3. Docker container for the generated Terraform documentation.
4. Load balancer setup on GCP with HTTPS redirects.
5. URL mapping for terraform.example.com.

#### Expected Outcome:
A fully automated and containerized solution that generates, updates, and hosts Terraform documentation on GCP, accessible securely via terraform.example.com.