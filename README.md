# 🌐 Multi-OS Web Deployment Scripts

This project includes two Bash scripts that **automate the deployment of a static website** on multiple Linux machines running either **CentOS/RHEL** or **Ubuntu/Debian** distributions.

## 📂 Scripts Overview

### 1. `multios_websetup.sh`
This script is responsible for:
- Automatically detecting the OS type (CentOS or Ubuntu).
- Installing required packages: `httpd`/`apache2`, `wget`, and `unzip`.
- Downloading a static website template.
- Deploying the website to Apache’s document root (`/var/www/html`).

### 2. `webdeploy.sh`
This script handles:
- Reading a list of remote hosts from a file named `remhosts`.
- Copying `multios_websetup.sh` to each host.
- Executing it remotely over SSH.
- Removing the script from the remote system after deployment.

---

## 🛠️ How to Use

### Step 1: Add Remote Hosts
Create a `remhosts` file in the same directory, with one host (IP or domain) per line:

```bash
192.168.1.10
192.168.1.11
example.com
```

### Step 2: Make Scripts Executable

```bash
chmod +x multios_websetup.sh webdeploy.sh
```

### Step 3: Run Deployment Script

```bash
./webdeploy.sh
```

> ⚠️ **Note:** The default SSH username is set to `devops`. You can modify the `USR` variable in `webdeploy.sh` to use a different username.

---

## 📦 Website Template Details

- **Template Name:** Barista Cafe  
- **Source:** [Tooplate](https://www.tooplate.com/view/2137-barista-cafe)  
- **Download URL:** [2137_barista_cafe.zip](https://www.tooplate.com/zip-templates/2137_barista_cafe.zip)

---

## ✅ Requirements

- SSH access (preferably with key-based authentication) to all remote hosts.
- Sudo privileges on remote machines.
- Apache-compatible Linux distributions (CentOS/RHEL or Ubuntu/Debian).
- Open port **80** (HTTP) on all target servers.

---

## 💻 Supported Platforms

- CentOS / RHEL 7+
- Ubuntu 18.04 / 20.04 / 22.04+

---

## 🔧 Customization

To deploy a different static website:
1. Update the `URL` and `ART_NAME` variables in `multios_websetup.sh` with the desired template link and folder name.
2. Save the changes and re-run `webdeploy.sh` to deploy the new website.
