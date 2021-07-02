# ingress-nginx-log-persistent
This project provide a solution to record and rotate all logs of nginx-ingress-controller.



# Features

When you deploy [ingress-nginx](https://kubernetes.github.io/ingress-nginx) according to the template in [./example](./example) , you will find that:

1. logs of `nginx-ingress-controller` exists in `/data/log/nginx-ingress-controller/` in your hosts
2. nginx's log : `access.log` and  `error.log`  exists in `/data/log/nginx-ingress-controller/` in your hosts
3. logrotate configuration will inject into sidecar container of `ingress-nginx`  and will take effect to  `access.log` and  `error.log` 



# Design

1. change some args of `ingress-nginx`
2. add initContainer to add permission of log of `ingress-nginx`, which is belong to user 101 (`www-data`)
3. add sideCar to do log rotate

If you are interested, welcome to read my [blog](https://segmentfault.com/a/1190000022200374) .



# Build

You can build a image : `adddirperm` by execute `docker build -t XXX -f ./Dockerfile .` in [addDirPerm](./addDirPerm) .



You can build a image : `logrotate` by execute `docker build -t XXX -f ./Dockerfile .` in [logrotate](./logrotate) .

