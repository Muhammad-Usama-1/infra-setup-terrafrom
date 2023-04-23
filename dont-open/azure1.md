create a resource group

Create a vnet and two subnet

create a vm in the subnet

create a private mysql server

create a key vault, create a secret

create a database in to it

https://learn.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-linux-vm-access-nonaad

crete a node script to get secret from VM

```js
// index.js

const { SecretClient } = require("@azure/keyvault-secrets");
const { DefaultAzureCredential } = require("@azure/identity");

// Your Azure Key Vault name and secret name
const keyVaultName = "<your-unique-keyvault-name>";
const keyVaultUri = `https://${keyVaultName}.vault.azure.net`;
const secretName = "mySecret";

// Authenticate to Azure
const credential = new DefaultAzureCredential();
const client = new SecretClient(keyVaultUri, credential);

// Get Secret with Azure SDK for JS
const getSecret = async (secretName) => {
  return (await client.getSecret(secretName)).value;
};

getSecret(secretName)
  .then((secretValue) => {
    console.log(
      `The value of secret '${secretName}' in '${keyVaultName}' is: '${secretValue}'`
    );
  })
  .catch((err) => {
    console.log(err);
  });
```

curl 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https%3A%2F%2Fvault.azure.net' -H Metadata:true

https://learn.microsoft.com/en-us/azure/key-vault/general/tutorial-javascript-virtual-machine?tabs=azure-cli

connect to mysql Database from terminal

```js
var fs = require("fs");
var mysql = require("mysql");
const { SecretClient } = require("@azure/keyvault-secrets");
const { DefaultAzureCredential } = require("@azure/identity");

// Your Azure Key Vault name and secret name
const keyVaultName = "<your-unique-keyvault-name>";
const keyVaultUri = `https://${keyVaultName}.vault.azure.net`;
const secretName = "mySecret";

// Authenticate to Azure
const credential = new DefaultAzureCredential();
const client = new SecretClient(keyVaultUri, credential);

// Get Secret with Azure SDK for JS
const getSecret = async (secretName) => {
  return (await client.getSecret(secretName)).value;
};

getSecret(secretName)
  .then((secretValue) => {
    // console.log(`The value of secret '${secretName}' in '${keyVaultName}' is: '${secretValue}'`);
    const config = {
      host: "host",
      user: "sgroot",
      password: "password",
      database: "databasename",
      port: 3306,
      ssl: {
        ca: fs.readFileSync("<path to CA cert file>"),
        rejectUnauthorized: true,
      },
    };

    var connection = mysql.createConnection();
    connection.connect(function (err) {
      if (err) throw err;
      console.log("Connected!");
    });
  })
  .catch((err) => {
    console.log(err);
  });

var connection = mysql.createConnection();
connection.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});
```

scp /path/to/local/myfile.txt username@192.168.1.100:/home/username/files/

connect to Node js with mysql

CRUD
