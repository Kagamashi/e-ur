# Delete all ResourceGroups with 'product' in name
for rg in $(az group list --query "[?contains(name, 'product')].name" -o tsv); do
  az group delete --name $rg --yes --no-wait
done

