set -e

git init
git config --global user.name "demonkiller2"
git config --global user.email "hiranyagarbh7@gmail.com"
sudo git config --system core.editor nano
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=25000'
git config --global push.default simple

echo "D O N E "
