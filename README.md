<h1 align="center">
  <img src="./assets/k8s-auto-setup.png" alt="icon" width="200"></img>
  <br>
  <b>Kubernetes Auto Setup</b>
</h1>

<p align="center">Auto setup k8s cluster with 1 master and [n] workers</p>

<!-- Badges -->
<p align="center">
  <a href="https://github.com/QuanBlue/k8s-auto-setup/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/QuanBlue/k8s-auto-setup" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/QuanBlue/k8s-auto-setup" alt="last update" />
  </a>
  <a href="https://github.com/QuanBlue/k8s-auto-setup/network/members">
    <img src="https://img.shields.io/github/forks/QuanBlue/k8s-auto-setup" alt="forks" />
  </a>
  <a href="https://github.com/QuanBlue/k8s-auto-setup/stargazers">
    <img src="https://img.shields.io/github/stars/QuanBlue/k8s-auto-setup" alt="stars" />
  </a>
  <a href="https://github.com/QuanBlue/k8s-auto-setup/issues/">
    <img src="https://img.shields.io/github/issues/QuanBlue/k8s-auto-setup" alt="open issues" />
  </a>
  <a href="https://github.com/QuanBlue/k8s-auto-setup/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/QuanBlue/k8s-auto-setup.svg" alt="license" />
  </a>
</p>

<p align="center">
  <b>
    <a href="https://github.com/QuanBlue/k8s-auto-setup">Documentation</a> •
    <a href="https://github.com/QuanBlue/k8s-auto-setup/issues/">Report Bug</a> •
    <a href="https://github.com/QuanBlue/k8s-auto-setup/issues/">Request Feature</a>
  </b>
</p>
<br/>
<details open>
<summary><b>Table of Contents</b></summary>

-  [Getting Started](#getting-started)
   -  [Prerequisites](#prerequisites)
   -  [Environment Variables](#environment-variables)
   -  [Run Locally](#run-locally)
-  [Usage](#usage)
-  [FAQ](#faq)
-  [Contributors](#contributors)
-  [Credits](#credits)
-  [License](#license)
</details>

# Getting Started

## Prerequisites

Before proceeding with the installation and usage of this project, ensure that you have the following prerequisites in place:

-  **Network Connectivity:** Docker requires network connectivity to download images, communicate with containers, and access external resources.
-  **Vagrant:** >= `2.4.0`, Install [here](https://developer.hashicorp.com/vagrant/tutorials/getting-started/getting-started-install?product_intent=vagrant)
-  VirtualBox: >= `7.0.0`, Install [here](https://www.virtualbox.org/wiki/Downloads)

## Environment Variables

If you wanna run this project with ec2 base, you must set up environment variables in `.env` file in `./aws-ec2`

**Cluster config (`env.sh`):**

-  `MASTER_NAME`: Name of master node (default: master)
-  `WORKER_NAME_PREFIX`: Prefix of worker node (default: worker)
-  `WORKER_NUM`: Number of worker node (default: 2)

Example:

```sh
# env.sh

export MASTER_NAME="master"
export WORKER_NAME_PREFIX="worker"
export WORKER_NUM=2
```

## Run Locally

To Auto Setup Kubernetes cluster, follow these steps:

```sh
bash ./setup.sh
```

You can interact with virtual machine create by `setup` command above:

```sh
# shutdown all machines
bash ./utils/shutdown_vm.sh

# start all machines
bash ./utils/start_vm.sh

# destroy all machines
bash ./utils/destroy_vm.sh
```

# Usage

Automatic create K8s cluster, follow these steps:

-  Install Vagrant plugins
-  Create cluster (nodes):
   -  Create machines (master node, worker nodes):
      -  Install Docker and K8s for machines
      -  Set up ssh key for machines
   -  Create Cluster:
      -  Setup master node: Create cluster
      -  Setup worker nodes: Join cluster

# FAQ

1. If you can not run shell script, try to grant permission to execute

```sh
chmod +x <shell-script>.sh
```

# Contributors

<a href="https://github.com/QuanBlue/k8s-auto-setup/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=QuanBlue/k8s-auto-setup" />
</a>

Contributions are always welcome!

# Credits

-  [Kubernetes](https://kubernetes.io/)
-  [Docker](https://www.docker.com/)
-  [Vagrant](https://www.vagrantup.com/)
-  [Virtualbox](https://www.virtualbox.org/)
-  Emojis are taken from [here](https://github.com/arvida/emoji-cheat-sheet.com)

# License

Distributed under the MIT License. See <a href="../LICENSE">`LICENSE`</a> for more information.

---

> Bento [@quanblue](https://bento.me/quanblue) &nbsp;&middot;&nbsp;
> GitHub [@QuanBlue](https://github.com/QuanBlue) &nbsp;&middot;&nbsp; Gmail quannguyenthanh558@gmail.com
