# OpenVPN-client

## Usage

```bash
docker run -d --device=/dev/net/tun --cap-add=NET_ADMIN \
    --name openvpn-client \
    --restart=unless-stopped \
    --volume $PWD/:/etc/openvpn/:ro -p 1080:1080 \
    xkrfer/openvpn-client-socks
```

Then connect to SOCKS proxy through through `localhost:1080` / `local.docker:1080`. For example:

```bash
curl --proxy socks5h://127.0.0.1:1080 ipinfo.io
```

If you cannot access the LAN, you can use **socat** to forward

```bash
# debian
sudo apt-get update
sudo apt-get install socat
sudo socat TCP-LISTEN:1081,fork TCP:127.0.0.1:1080
```

create service
```bash
sudo nano /etc/systemd/system/socat.service
```
set service
```makfile
[Unit]
Description=Socat TCP Port Forwarding
After=network.target

[Service]
ExecStart=/usr/bin/socat TCP-LISTEN:1081,fork TCP:127.0.0.1:10081
Restart=always

[Install]
WantedBy=default.target
```
reload
```
sudo systemctl daemon-reload
sudo systemctl enable socat.service
sudo systemctl start socat.service
sudo systemctl status socat.service
```



