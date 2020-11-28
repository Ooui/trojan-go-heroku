#!/bin/sh

# Download and install trojan-go
mkdir /tmp/trojan-go
curl -L -H "Cache-Control: no-cache" -o /tmp/trojan-go/trojan-go.zip https://github.com/p4gefau1t/trojan-go/releases/download/v0.8.2/trojan-go-linux-amd64.zip
unzip /tmp/trojan-go/trojan-go.zip -d /tmp/trojan-go
install -m 755 /tmp/trojan-go/trojan-go /usr/local/bin/trojan-go

# Remove temporary directory
rm -rf /tmp/trojan-go

# config trojan
install -d /etc/trojan-go
cat << EOF > /etc/trojan-go/config.json
{
    "password": [
        "$PASSWORD"
    ],
    "websocket": {
        "enabled": true,
        "path": "/",
        "host": ""
    }
}
EOF

# run trojan
/usr/local/bin/trojan-go -config /etc/trojan-go/config.json
