# Terraform Proxmox Virtual Machine Module

This Terraform module creates Proxmox virtual machines based on the provided configuration.

## Prerequisites

- [Terraform](https://www.terraform.io/) installed (version 0.13.0 or later)
- Proxmox provider (version 0.0.1)
- TLS provider (version 4.0.5)

## Usage

1. Clone the repository:

    ```bash
    git clone <repository_url>
    ```

2. Navigate to the module directory:

    ```bash
    cd terraform-proxmox-vm-module
    ```

3. Create a Terraform script (e.g., `main.tf`) and define your virtual machines:

    ```hcl
    module "my_virtual_machines" {
      source             = "./path/to/module"
      proxmox_api_url    = "https://your-proxmox-api-url:8006/api2/json"
      proxmox_api_token_id     = "your-proxmox-token-id"
      proxmox_api_token_secret = "your-proxmox-token-secret"

      virtual_machines = {
        vm1 = {
          name            = "vm1"
          # Add other configuration parameters
        }
        vm2 = {
          name            = "vm2"
          # Add other configuration parameters
        }
      }
    }
    ```

4. Initialize Terraform and apply the configuration:

    ```bash
    terraform init
    terraform apply
    ```

5. Review the changes and confirm by typing `yes`.

## Configuration Parameters

- `proxmox_api_url`: URL of the Proxmox API.
- `proxmox_api_token_id`: Token ID for authentication.
- `proxmox_api_token_secret`: Token secret for authentication.
- `virtual_machines`: Map of virtual machine configurations.

## Outputs

- `virtual_machine_private_key`: Private SSH key for accessing virtual machines.

## Provider Configuration

You can customize the provider configuration by updating the `provider.tf` file.

## Variables

- `proxmox_api_url`: Proxmox API URL.
- `proxmox_api_token_id`: Proxmox API token ID.
- `proxmox_api_token_secret`: Proxmox API token secret.
- `virtual_machines`: Map of virtual machine configurations.

## License

This module is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
