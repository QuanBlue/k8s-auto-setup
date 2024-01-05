declare -A DOCKER_MACHINE=(
   [manager]=3000
   [worker1]=3001
   [worker2]=3002
)

# ------------------------
# Prequisites
# ------------------------
# remove all containers
docker rm -f $(docker ps -qa)

# remove "test-k8s" network if exists
docker network rm -f test-k8s

# create network "test-k8s"
docker network create -d bridge test-k8s

# ------------------------
# Create nodes
# ------------------------
# build docker image
docker build -t k8s-node:v1 ./dockerfile .

# create container
for machine in ${!DOCKER_MACHINE[@]}; do
   docker run -itd \
      --name=${machine} \
      --hostname=${machine} \
      --network=${NETWORK} \
      k8s-node:v1
done

# get IP address of all nodes in "test-k8s" network
# docker network inspect --format='{{range .Containers}}{{.Name}}: {{.IPv4Address}}{{"\n"}}{{end}}' test-k8s
