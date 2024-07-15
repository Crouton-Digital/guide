#!/bin/bash

echo "export ALIAS=\"$ALIAS\"" >> ~/.bash_profile
echo "export DISCORD=\"$DISCORD\"" >> ~/.bash_profile
echo "export WEBSITE=\"$WEBSITE\"" >> ~/.bash_profile
echo "export EMAIL=\"$EMAIL\"" >> ~/.bash_profile
echo "export DESCRIPTION=\"$DESCRIPTION\"" >> ~/.bash_profile
echo "export LOGO_URL=\"$LOGO_URL\"" >> ~/.bash_profile
echo "export MAINNET_SERVER_IP=\"$MAINNET_SERVER_IP\"" >> ~/.bash_profile

NAMADA_BASE_DIR=$(namadac utils default-base-dir)
echo "export NAMADA_BASE_DIR=\"$NAMADA_BASE_DIR\"" >> ~/.bash_profile

TX_FILE_PATH="$NAMADA_BASE_DIR/pre-genesis/transactions.toml"
echo "export TX_FILE_PATH=\"$TX_FILE_PATH\"" >> ~/.bash_profile

source ~/.bash_profile

clear

print_var() {
    printf "\033[1m%-20s:\033[0m \033[32m%s\033[0m\n" "$1" "$2"
}

echo -e "\033[1m\033[32mVariables have been successfully added to .bash_profile:\033[0m"
print_var "ALIAS" "$ALIAS"
print_var "DISCORD" "$DISCORD"
print_var "WEBSITE" "$WEBSITE"
print_var "EMAIL" "$EMAIL"
print_var "DESCRIPTION" "$DESCRIPTION"
print_var "LOGO_URL" "$LOGO_URL"
print_var "MAINNET_SERVER_IP" "$MAINNET_SERVER_IP"
print_var "NAMADA_BASE_DIR" "$NAMADA_BASE_DIR"
print_var "TX_FILE_PATH" "$TX_FILE_PATH"
