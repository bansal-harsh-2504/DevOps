# 📘 Linux Roadmap for DevOps (In-Depth)

## 🔹 1. Basic Linux Commands
- `ls`, `cd`, `pwd`, `mkdir`, `rm`, `cp`, `mv`, `touch`
- `cat`, `more`, `less`, `head`, `tail`
- `echo`, `date`, `whoami`, `hostname`
- `clear`, `history`, `man`, `which`, `whereis`

---

## 🔹 2. File & Directory Management
- Absolute vs relative paths
- `file`, `stat`, `wc`, `sort`, `cut`, `uniq`
- Wildcards: `*`, `?`
- File formats & extensions

---

## 🔹 3. Permissions & Ownership
- `chmod`, `chown`, `chgrp`
- File permissions: `rwx`, numeric vs symbolic
- Default permissions with `umask`

---

## 🔹 4. Users & Groups
- `useradd`, `usermod`, `passwd`, `groupadd`
- `id`, `groups`, `su`, `sudo`
- Files: `/etc/passwd`, `/etc/shadow`, `/etc/group`
- `visudo` for sudoers config

---

## 🔹 5. Process Management
- `ps`, `top`, `htop`, `kill`, `nice`, `renice`
- Background jobs: `&`, `jobs`, `fg`, `bg`, `nohup`
- Services: `systemctl`, `service`

---

## 🔹 6. Package Management
- Debian: `apt`, `dpkg`
- RedHat: `yum`, `dnf`, `rpm`
- Repos, GPG keys

---

## 🔹 7. Networking
- `ip`, `ifconfig`, `ping`, `traceroute`, `netstat`, `ss`
- `nslookup`, `dig`, `host`
- `scp`, `rsync`, `wget`, `curl`
- SSH: `ssh`, `ssh-keygen`, config, port forwarding

---

## 🔹 8. Disk & Storage
- `df`, `du`, `mount`, `umount`
- `lsblk`, `fdisk`, `parted`, `blkid`
- File systems: `ext4`, `xfs`, `btrfs`
- `fstab` for automounting

---

## 🔹 9. Logs & Monitoring
- `/var/log/`, `journalctl`, `dmesg`
- `top`, `iotop`, `vmstat`, `netstat`
- Log parsing: `grep`, `awk`, `sed`, `tail -f`
- `logrotate` for log rotation

---

## 🔹 10. Shell Scripting & Automation
- Bash basics: shebang, variables, loops, if-else
- Debugging: `bash -x`
- Cron jobs: `crontab`, log locations

---

## 🔹 11. Services & Init Systems
- `systemd`, `init.d`
- Managing services: `systemctl`, `service`
- Enable/disable on boot

---

## 🔹 12. File Compression & Archiving
- `tar`, `gzip`, `gunzip`, `bzip2`, `xz`
- `.tar.gz`, `.zip`, `.rar`

---

## 🔹 13. Environment Variables
- Global: `/etc/environment`, `/etc/profile`
- User: `~/.bashrc`, `~/.profile`
- `export`, `printenv`, `.env` files in CI/CD

---

## 🔹 14. System Performance Tuning
- `vmstat`, `iostat`, `sar`
- `ulimit`, `sysctl`
- Kernel tuning

---

## 🔹 15. Security Essentials
- File and SSH hardening
- `iptables`, `ufw`, `fail2ban`, `auditd`
- Secure file transfer: SCP, SFTP

---

## 🔹 16. DevOps-Specific Linux Use
- Docker/Kubernetes CLI (Linux-based)
- Shell scripting for CI/CD
- Jenkins agents on Linux
- Managing `.env`, configmaps, secrets

---

**Pro Tip:** Practice commands regularly and create scripts to automate small tasks to build fluency.
