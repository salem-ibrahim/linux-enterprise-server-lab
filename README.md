# Linux Enterprise Server Lab

A Bash automation project that simulates enterprise Linux server administration tasks.

## 📌 Overview

This project automates common Linux system administration tasks using Bash scripts and configuration files.

It is designed as a practical portfolio project demonstrating Linux administration, automation, and server management skills.

---

## ✨ Features

- User Management
- Group Management
- Directory Creation
- Permission Configuration
- ACL Management
- Apache Installation & Configuration
- SSH Hardening
- UFW Firewall Configuration
- Automated Backup
- Restore Backup
- Cron Job Automation
- One-click Company Setup

---

## 📂 Project Structure

```text
linux-enterprise-server-lab/
├── company/
├── configs/
├── docs/
├── screenshots/
├── scripts/
└── README.md
```

---

## 📁 Configuration Files

| File | Description |
|------|-------------|
| users.csv | Users configuration |
| directories.csv | Company directories |
| permissions.csv | Directory permissions |
| acl.csv | ACL configuration |
| apache.conf | Apache settings |
| ssh.conf | SSH configuration |
| firewall.conf | Firewall settings |
| backup.conf | Backup settings |
| cron.conf | Cron configuration |

---

## 📜 Scripts

| Script | Description |
|---------|-------------|
| create_groups.sh | Create Linux groups |
| create_users.sh | Create Linux users |
| create_directories.sh | Create company directories |
| configure_permissions.sh | Configure permissions |
| configure_acl.sh | Configure ACL rules |
| install_apache.sh | Install and configure Apache |
| configure_ssh.sh | Configure SSH security |
| configure_firewall.sh | Configure UFW firewall |
| backup.sh | Create compressed backups |
| restore.sh | Restore backups |
| cron_setup.sh | Configure scheduled backups |
| setup_company.sh | Execute the complete setup |

---

## ⚙️ Requirements

- Ubuntu Server
- Bash
- Apache2
- OpenSSH Server
- UFW
- ACL package

---

## 🚀 Installation

Clone the repository

```bash
git clone https://github.com/salem-ibrahim/linux-enterprise-server-lab.git
```

Go to project directory

```bash
cd linux-enterprise-server-lab
```

Give execution permissions

```bash
chmod +x scripts/*.sh
```

Run the master setup

```bash
sudo ./scripts/setup_company.sh
```

---

## 📸 Screenshots

Coming Soon

---

## 🛠 Technologies

- Bash
- Ubuntu Linux
- Apache2
- OpenSSH
- UFW
- Cron
- Linux ACL

---

## 👨‍💻 Author

Salem Ibrahim

GitHub

https://github.com/salem-ibrahim

---

## ⭐ Future Improvements

- Idempotent scripts
- Better error handling
- Logging
- Interactive menus
- Automatic rollback
