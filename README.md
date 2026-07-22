# Linux Enterprise Server Lab

![Linux](https://img.shields.io/badge/Linux-Ubuntu-E95420?logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?logo=gnubash&logoColor=white)
![Apache](https://img.shields.io/badge/Apache-2.4-D22128?logo=apache&logoColor=white)
![OpenSSH](https://img.shields.io/badge/OpenSSH-Security-black?logo=openssh&logoColor=white)
![UFW](https://img.shields.io/badge/UFW-Firewall-blue)
![License](https://img.shields.io/badge/License-MIT-green)

A Bash-based automation project that simulates real-world Linux server administration tasks in an enterprise environment.

---

# 📌 Overview

Linux Enterprise Server Lab is a practical Linux Administration project built entirely with Bash scripting.

The project automates common system administration tasks such as user and group management, directory creation, permissions, ACL configuration, Apache deployment, SSH hardening, firewall configuration, backup & restore, and scheduled automation using Cron.

The project follows a modular structure where each component is configurable through dedicated configuration files, making it easy to customize and extend.

---

# ✨ Features

- User Management
- Group Management
- Directory Creation
- Permission Configuration
- ACL Management
- Apache Installation & Configuration
- SSH Hardening
- UFW Firewall Configuration
- Automated Backup
- Backup Restore
- Cron Job Automation
- One-click Company Setup

---

# 🎯 Key Highlights

- Modular Bash scripts
- Configuration-driven deployment
- Enterprise-style project structure
- Security hardening
- Backup & Restore automation
- Automated server configuration
- Reusable configuration files
- Easy to extend and maintain

---

# 📂 Project Structure

```text
linux-enterprise-server-lab/
├── company/
├── configs/
│   ├── users.csv
│   ├── directories.csv
│   ├── permissions.csv
│   ├── acl.csv
│   ├── apache.conf
│   ├── ssh.conf
│   ├── firewall.conf
│   ├── backup.conf
│   └── cron.conf
│
├── docs/
├── screenshots/
│   ├── 01-apache-webpage.png
│   ├── 02-ssh-configuration.png
│   ├── 03-firewall.png
│   ├── 04-backup.png
│   └── 05-restore.png
│
├── scripts/
│   ├── create_groups.sh
│   ├── create_users.sh
│   ├── create_directories.sh
│   ├── configure_permissions.sh
│   ├── configure_acl.sh
│   ├── install_apache.sh
│   ├── configure_ssh.sh
│   ├── configure_firewall.sh
│   ├── backup.sh
│   ├── restore.sh
│   ├── cron_setup.sh
│   └── setup_company.sh
│
└── README.md
```

---

# 📁 Configuration Files

| File | Description |
|------|-------------|
| users.csv | Linux users configuration |
| directories.csv | Company directories |
| permissions.csv | File and directory permissions |
| acl.csv | ACL rules |
| apache.conf | Apache server configuration |
| ssh.conf | SSH server settings |
| firewall.conf | UFW firewall configuration |
| backup.conf | Backup settings |
| cron.conf | Scheduled backup configuration |

---

# 📜 Scripts

| Script | Description |
|---------|-------------|
| create_groups.sh | Create Linux groups |
| create_users.sh | Create Linux users |
| create_directories.sh | Create company directory structure |
| configure_permissions.sh | Configure file permissions |
| configure_acl.sh | Configure ACL rules |
| install_apache.sh | Install and configure Apache |
| configure_ssh.sh | Secure SSH configuration |
| configure_firewall.sh | Configure UFW firewall |
| backup.sh | Create compressed backups |
| restore.sh | Restore backups |
| cron_setup.sh | Configure Cron jobs |
| setup_company.sh | Execute the complete deployment |

---

# ⚙️ Requirements

- Ubuntu Server
- Bash
- Apache2
- OpenSSH Server
- UFW
- ACL package

---

# 🚀 Installation

Clone the repository

```bash
git clone https://github.com/salem-ibrahim/linux-enterprise-server-lab.git
```

Navigate to the project directory

```bash
cd linux-enterprise-server-lab
```

Grant execution permissions

```bash
chmod +x scripts/*.sh
```

Run the complete deployment

```bash
sudo ./scripts/setup_company.sh
```

---

# ▶️ Usage

Run the full deployment

```bash
sudo ./scripts/setup_company.sh
```

Or execute individual modules

```bash
sudo ./scripts/create_groups.sh

sudo ./scripts/create_users.sh

sudo ./scripts/create_directories.sh

sudo ./scripts/configure_permissions.sh

sudo ./scripts/configure_acl.sh

sudo ./scripts/install_apache.sh

sudo ./scripts/configure_ssh.sh

sudo ./scripts/configure_firewall.sh

sudo ./scripts/backup.sh

sudo ./scripts/restore.sh

sudo ./scripts/cron_setup.sh
```

---

# 📸 Screenshots

## Apache Web Server

![Apache](screenshots/01-apache-webpage.png)

---

## SSH Configuration

![SSH](screenshots/02-ssh-configuration.png)

---

## UFW Firewall

![Firewall](screenshots/03-firewall.png)

---

## Backup

![Backup](screenshots/04-backup.png)

---

## Restore

![Restore](screenshots/05-restore.png)

---

# 💡 Skills Demonstrated

- Linux Administration
- Bash Scripting
- Linux Automation
- User & Group Management
- File Permissions
- Access Control Lists (ACL)
- Apache Web Server Administration
- SSH Hardening
- UFW Firewall Administration
- Backup & Restore Automation
- Cron Job Scheduling
- Configuration Management
- Infrastructure Automation

---

# 🛠 Technologies

- Bash
- Ubuntu Linux
- Apache2
- OpenSSH
- UFW
- Cron
- Linux ACL

---

# ⭐ Future Improvements

- Interactive CLI menu
- Better logging system
- Idempotent scripts
- Automatic rollback
- Service health monitoring
- Email notifications
- ShellCheck integration
- GitHub Actions CI/CD
- Package installation validation

---

# 👨‍💻 Author

**Salem Ibrahim**

- GitHub: https://github.com/salem-ibrahim

---

# 📄 License

This project is licensed under the MIT License.

---

## ⭐ If you found this project useful, consider giving it a Star.
