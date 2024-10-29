# Bashmap

A simple bash script designed to use nmap to quickly scan for open ports, then run Nmap with the -A flag to enumerate OS, services, and versions. Created to simplify scanning a small list of IPs for the OSCP exam and in my work as a penetration tester.

## Prerequisites

Tested in Kali Linux. If running in another OS you must have NMAP installed.

## Installing Bashmap

To install Bashmap, follow these steps:

```bash
git clone https://github.com/Br14n41/bashmap.git
cd bashmap
chmod +x bashmap.sh
```

## Using Bashmap
```bash
./bashmap.sh hosts-file
```
