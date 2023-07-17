-- git flow init
-- git flow feature start snowterra


-- https://github.com/hshc/sfguide-terraform-sample

-- https://quickstarts.snowflake.com/guide/terraforming_snowflake/index.html?index=..%2F..index#2
-- 3. Create a Service User for Terraform

use role accountadmin;

-- cd ~/.ssh
-- openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out snowflake_tf_snow_key.p8 -nocrypt
-- openssl rsa -in snowflake_tf_snow_key.p8 -pubout -out snowflake_tf_snow_key.pub 
---- copy and past base64 pub key content to following RSA_PUBLIC_KEY value
CREATE USER "tf-snow" RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA+KzKPfyultP6ht0NN5SKxTcrm84fE5s2XYaq/z3Me3S8ZbJgVDRzHiSf9JEdvXLgjXOwD9viIag1rq2LmqQkk9vXyVarUcvZhR2xWKTJjA+miH4oYoLg8qlE5GK4pSquVwTMwDfA6Azf8ohkKV4a3C9jY0k+DTSTBR4Xbr5/wT/ltkEoYxGr3uLzzZ8ZKu6mE8uEHFmB/y1pFD1cWpDjNjO3w9e3dHVJm/N6APBsgqkl7ahf3jVmxEvngfCN1iST1pd+Mxwij2sh3OWJegF4e91mKvCTovsMjUjOFNOACCvMvn2Lh4f3/41I/Ibz8J4p0kk4zC4ex6ZHlDv6BPpEKQIDAQAB' DEFAULT_ROLE=PUBLIC MUST_CHANGE_PASSWORD=FALSE;

GRANT ROLE SYSADMIN TO USER "tf-snow";
GRANT ROLE SECURITYADMIN TO USER "tf-snow";

show grants to user "tf-snow";

-- https://quickstarts.snowflake.com/guide/terraforming_snowflake/index.html?index=..%2F..index#3
-- 4. Setup Terraform Authentication
SELECT current_account() as YOUR_ACCOUNT_LOCATOR, current_region() as YOUR_SNOWFLAKE_REGION_ID;

-- cat << EOF | tee ~/snow.env
-- export SNOWFLAKE_USER="tf-snow"
-- export SNOWFLAKE_PRIVATE_KEY_PATH="~/.ssh/snowflake_tf_snow_key.p8"
-- export SNOWFLAKE_ACCOUNT="PA87354"
-- export SNOWFLAKE_REGION="eu-west-3.aws"
-- EOF
-- echo "source ~/snow.env" >> ~/.zshrc

-- https://quickstarts.snowflake.com/guide/terraforming_snowflake/index.html?index=..%2F..index#4
-- 5. Declaring Resources
-- In sfguide-terraform-sample folder :
-- cat << EOF | tee ./.gitignore
-- *.terraform*
-- *.tfstate
-- *.tfstate.*
-- EOF
-- terraform init

-- https://quickstarts.snowflake.com/guide/terraforming_snowflake/index.html?index=..%2F..index#6
-- 7. Commit changes to source control

-- git flow init
-- git flow feature start dbwh
-- git add main.tf
-- git add .gitignore
-- git commit -m "Add Database and Warehouse"
-- git push origin HEAD

-- 8. Running Terraform
-- terraform apply

-- 10. Commit Changes to Source Control
-- git checkout -b svcuser
-- git add main.tf
-- git add outputs.tf
-- git commit -m "Add Service User, Schema, Grants"
-- git push origin HEAD
