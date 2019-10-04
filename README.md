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