Step 1: Create an Azure Storage Account and Blob Container
You can create the storage account using Azure CLI or the Azure portal. Here’s how you can create it using Azure CLI:

- Create a Resource Group (if you don't have one)
```bash
az group create --name <resource-group-name> --location <location>
```
- Create the Storage Account
```bash
az storage account create \
  --resource-group <resource-group-name> \
  --name <storage-account-name> \
  --sku Standard_LRS \
  --encryption-services blob \
  --kind StorageV2
```
- Create a Blob Container
```bash
az storage container create \
  --account-name <storage-account-name> \
  --name <container-name>
```
- copy paste details to backend.tf
```terraform
terraform {
  backend "azurerm" {
    resource_group_name  = "<resource-group-name>"
    storage_account_name = "<storage-account-name>"
    container_name       = "<container-name>"
    key                  = "terraform.tfstate" # Name of the state file
  }
}
```

---
# Authentication for github pipeline to run Terraform
In a CI/CD pipeline, the best way to authenticate Terraform with Azure is by using a Service Principal (which is the recommended approach). Here’s how to set it up:

Steps to Authenticate Using a Service Principal
Create a Service Principal: If you haven’t already created a Service Principal, you can create one using the following Azure CLI command:

```bash
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
```
This will give you an output like:

```json
{
  "appId": "<CLIENT_ID>",
  "displayName": "myServicePrincipal",
  "password": "<CLIENT_SECRET>",
  "tenant": "<TENANT_ID>"
}
```
Add the credentials to GitHub Secrets: Add the following secrets to your GitHub repository or organization:

```
ARM_CLIENT_ID: the appId from the service principal.
ARM_CLIENT_SECRET: the password from the service principal.
ARM_SUBSCRIPTION_ID: your Azure subscription ID.
ARM_TENANT_ID: the tenant ID from the service principal.
```
Modify your GitHub Actions Pipeline: Update your GitHub Actions YAML to export these secrets as environment variables for Terraform. Here's an example of how you can configure your YAML file:

```yaml

      - name: Terraform Init
        env:
          ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
          ARM_CLIENT_SECRET: ${{ secrets.ARM_CLIENT_SECRET }}
          ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
          ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
        run: |
          terraform init
```