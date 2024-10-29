# Script to simplify nmap scanning

# Check if filename is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: bashmap <host_file>"
    exit 1
fi

# Read the file line by line
while IFS= read -r ip
do
    echo "Scanning IP: $ip"

    # Run nmap to scan for open ports
    ports=$(nmap -Pn -p- $ip | grep ^[0-9] | cut -d ' ' -f 1 | tr -d '/tcp' | paste -sd ',')

    # If ports were found, run service scan
    if [ -n "$ports" ]; then
        echo "Open ports: $ports"
        echo "Running service scan..."
        nmap -sS -A -p$ports $ip --stats 10s -oA full_scan
    else
        echo "No open ports found."
    fi

# Convert XML to HTML
xsltproc full_scan.xml -o full_scan.html

done < "$1"
