# Bashmap

Bashmap is a simple bash script designed to use nmap to quickly scan for open ports, then run Nmap with the -A flag to enumerate OS, services, and versions. Created to simplify scanning a small list of IPs for the OSCP exam.

## Prerequisites

Before you begin, ensure you have met the following requirements:

* Tested in Kali Linux. If running in another OS you must have NMAP installed.

## Installing Bashmap

To install Bashmap, follow these steps:

```bash
git clone https://github.com/username/bashmap.git
cd bashmap
chmod +x bashmap.sh
```

## Using Bashmap
```bash
./bashmap.sh list-of-ips.txt
```
