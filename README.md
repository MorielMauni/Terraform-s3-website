
S3 Bucket Static Website with Terraform

This repository contains Terraform configuration files for creating and hosting a static website on an AWS S3 bucket.

Features

- Create an S3 bucket and configure it as a static website.
- Set up bucket ownership and public access controls.
- Deploy static files (HTML, CSS, images) to the S3 bucket.
- Enable custom error and index document support.

Files

- **main.tf**: Defines the S3 bucket, access controls, and static file uploads.
- **variables.tf**: Contains variable declarations for reusability and flexibility.
- **provider.tf**: Specifies the AWS provider and region.
- **outputs.tf**: Outputs key information like bucket URL.
- **index.html**, **error.html**, **styles.css**, **profile.png**: Static website files.

Prerequisites

- AWS account with appropriate permissions.
- Terraform installed on your machine.
- Static website files available for upload.

Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/MorielMauni/Terraform-s3-website.git
   ```

2. Navigate to the project directory:
   ```bash
   cd s3-bucket-website
   ```

3. Update `variables.tf` with your desired values, including `s3_bucket_name`.

4. Initialize Terraform:
   ```bash
   terraform init
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

6. Access your website using the S3 bucket URL.

Author

Created by Moriel Mauni. If you have any questions, please contact [morielmauni@gmail.com](mailto:morielmauni@gmail.com).

---
For more details, visit the [AWS S3 documentation](https://docs.aws.amazon.com/s3/index.html).
