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
