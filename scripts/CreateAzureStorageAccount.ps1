$rgName = "rg-terraform-tfstate-01"
$location = "northeurope"
$storageAccount = "tfstatestorage011"
$container = "tfstatecontainer01"

# create resource group
az group create --name $rgName --location $location

# create storage account
az storage account create `
    --name $storageAccount `
    --resource-group $rgName `
    --kind StorageV2 `
    --sku Standard_LRS `
    --https-only true `
    --allow-blob-public-access false

# create storage container
az storage container create --name $container --account-name $storageAccount --public-access "off"
