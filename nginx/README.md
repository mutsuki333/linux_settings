# Nginx Cheatsheet

## URL Matching & URI rewriting
```Nginx
location =  <path>  (longest match wins)
location ^~ <path>  (longest match wins)
location ~  <path>  (first defined match wins)
location    <path>  (longest match wins)
Here is the config:

// match all css/js/images in resource path

location ~ ^/resources {
        root   /mypath/myurl.com;
        try_files $uri =404;
        break;
}

// allow myurl.com/register etc:

location ~  ^/([a-z]+)/(.*)$ {
        root   /mypath/myurl.com;
        rewrite ^/([a-z]+)(.*)$    /index.php?p1=$1&p2=$2;
}

// everything else:

location ~ / {
    root   /mypath/myurl.com;
    index  index.php;
}
```
