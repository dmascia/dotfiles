while read p; do
    code --install-extension $p
done <./ext.txt

sudo cp ./settings.json $HOME/Library/Application\ Support/Code/User/settings.json

ECHO "Copied setting.json"