# Terraform AWS Static Website

This project demonstrates how to deploy a static website on AWS using Terraform. It showcases the power of Infrastructure as Code (IaC) for managing cloud resources efficiently.

## Features

- S3 bucket configured for static website hosting
- Automated deployment pipeline using Terraform

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI configured with appropriate credentials
- Basic knowledge of AWS services and Terraform

## Quick Start

1. Clone this repository:
```   
git clone https://github.com/your-username/terraform-aws-static-website.git
cd terraform-aws-static-website
```

2. Initialize Terraform:
```
terraform init
```

3. Review and modify the `variables.tf` file to customize your bucket name

5. Plan the Terraform execution:
```
terraform plan
```

5. Apply the Terraform configuration:
```
terraform apply
```
OR using specific variables for the bucket
```
terraform apply apply -auto-approve -var="bucket_name=desiredbucketname01234a"
```
6. After successful application, Terraform will output the website URL.

## Project Structure

- `main.tf`: Main Terraform configuration file
- `variables.tf`: Input variables for the Terraform module
- `outputs.tf`: Output values after Terraform apply
- `uploads.tf`: Uploads files to S3 for the website
- `index.html`: Main page of the static website
- `error.html`: Custom 404 error page
- `logoawstf.png`: Logo for the index page

## Customization

You can customize the website content by modifying the HTML files in the project root. Update the Terraform configuration in `main.tf` to add or modify AWS resources as needed.

## Clean Up

To avoid incurring unnecessary costs, remember to destroy the resources when you're done:
```terraform destroy```

## Troubleshooting

If you encounter issues with the default page:

1. Ensure `index.html` is at the root of your S3 bucket.
2. Check the content type of `index.html` is set to "text/html".
3. Verify the S3 bucket policy allows public read access.
4. If you get an error on uploading objects, try applying it again. (because the first apply configures ACLs to accept file uploads and doesn not works consecutively)
5. If using CloudFront, ensure the default root object is set to "index.html".

## Author

Pawan Kumar Pradhan
- Security Researcher | AI, Cybersecurity & Cloud
- Email: p.pradhan1997@gmail.com
- Website: [me.pawankpradhan.com](https://me.pawankpradhan.com)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for detai
