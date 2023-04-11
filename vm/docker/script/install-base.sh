export DEBIAN_FRONTEND=noninteractive; \
sudo apt-get update; \
sudo apt-get upgrade -y; \
sudo apt-get update; \
sudo apt-get install -y \
software-properties-common \
apt-transport-https \
apt-utils \
ca-certificates \
lsb-release \
systemd \
gnupg \
gnupg1 \
gnupg2 \
wget \
curl \
openssl \
git; \
sudo mkdir -p /etc/apt/keyrings; \
curl -fsSL https://download.docker.com/linux/debian/gpg \
| sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg; \
echo \
"deb [arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update; \
sudo apt-get install -y \
docker-ce \
docker-ce-cli \
docker-compose-plugin; \
sudo usermod -aG docker "vagrant"; \
sudo systemctl restart docker
