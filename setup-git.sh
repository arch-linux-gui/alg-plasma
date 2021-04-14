#make sure you have forked this project.

set -e

git init
git config --global user.name "" #enter name
git config --global user.email "" #enter github linked email id
sudo git config --system core.editor nano
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=25000'
git config --global push.default simple

echo "D O N E "
