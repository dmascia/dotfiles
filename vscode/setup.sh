while read p; do
    code --install-extension $p
done <./vscode/ext.txt

sudo cp ./vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

ECHO "Copied setting.json"