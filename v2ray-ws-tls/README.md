# docker-compose-v2ray-ws-tls
A docker-compose deployment for `v2ray + WebSocket + TLS` setup.


## 1. Server setup

1. download files
```
git clone https://github.com/soulong/docker-compose-v2ray-ws-tls.git
```

2. Install docker and docker-compose with `setup.sh`
(If not worked, you can install manually)

## 2. Config modify

1.Update `./configs/v2ray/config.json`

- `uuid`
- `client@example.com`

2.Update `./configs/Caddyfile`

- Replace `xx.xx.xx` with your real domain

## 3. Start

run as daemon

```
docker-compose up -d
```

## 4. Setup client
See `./examples`

- client.json: for v2ray 4.20.0
- client.legacy.json: for old v2ray or v2rayU
- transparent-proxy.json: gateway proxy thru dokodemo-door + iptables
