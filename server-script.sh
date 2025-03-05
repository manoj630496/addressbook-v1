sudo yum install git -y
sudo yum install docker -y
sudo systemctl start docker

if [ -d "addressbook-v1" ]
then
  echo "repo is cloned and exists"
  cd /home/ec2-user/addressbook-v1
  git pull origin b3
else
  git clone https://github.com/manoj630496/addressbook-v1.git
fi

cd /home/ec2-user/addressbook-v1
git checkout b3

sudo docker build -t $1
