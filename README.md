# 3-nodes-loadbalancing-architecture

## Setup to test nginx round robin load balancing

### On localmachine

Generate traffic

```
for x in (seq 100)
    curl http://10.0.0.10/ > /dev/null
    sleep 0.5
end

# ab -n 100 -c 10 http://10.0.0.10/  
```

### On lb and other web hosts

```
watch --difference --interval 0.1 'sudo cat /var/log/nginx/access.log | wc'
```

### Creating 3-node swarm


```
docker swarm init --advertise-addr 10.0.0.10
```

* https://medium.com/@Grigorkh/docker-for-beginners-part-4-deploying-an-app-to-a-swarm-620b4d67e7c3
* https://github.com/docker/docker.github.io/blob/master/swarm/install-w-machine.md