sudo apt update

<!-- sudo apt upgrade
hostnamectl -->

sudo apt update
sudo apt install wget curl gnupg2 software-properties-common apt-transport-https ca-certificates lsb-release
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-6.gpg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.21_amd64.deb
sudo dpkg -i ./libssl1.1_1.1.1-1ubuntu2.1~18.04.21_amd64.deb -y
sudo apt update
sudo apt install mongodb-org
sudo systemctl enable --now mongod
sudo systemctl status mongod.service

<!-- for pretunnel  -->

sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb https://repo.pritunl.com/stable/apt jammy main
EOF

sudo apt --assume-yes install gnupg
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A
gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A | sudo tee /etc/apt/trusted.gpg.d/pritunl.asc
sudo apt update
sudo apt --assume-yes install pritunl
sudo pritunl setup-key
sudo pritunl default-password

<!-- Forl pritunl-client-electron -->

sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb https://repo.pritunl.com/stable/apt jammy main
EOF

sudo apt --assume-yes install gnupg
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A
gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A | sudo tee /etc/apt/trusted.gpg.d/pritunl.asc
sudo apt update
sudo apt install pritunl-client-electron

<!-- 0000 -->

sudo netstat -tulpn | grep LISTEN
