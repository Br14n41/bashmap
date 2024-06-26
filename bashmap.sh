# Script to simplify nmap scanning

# Check if filename is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ip_file.txt>"
    exit 1
fi

# Read the file line by line
while IFS= read -r ip
do
    echo "Scanning IP: $ip"

    # Run nmap to scan for open ports
    ports=$(nmap -Pn -p- -T4 $ip | grep ^[0-9] | cut -d ' ' -f 1 | tr -d '/tcp' | paste -sd ',')

    # If ports were found, run service scan
    if [ -n "$ports" ]; then
        echo "Open ports: $ports"
        echo "Running service scan..."
        nmap -Pn -A -p$ports $ip -oX $ip.xml
    else
        echo "No open ports found."
    fi

# Convert XML to HTML
xsltproc $ip.xml -o $ip.html

done < "$1"
