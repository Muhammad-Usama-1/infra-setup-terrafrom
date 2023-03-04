## Install Nginx

sudo apt update
sudo apt install nginx

## Allow Nginx if you you have enable firewall

sudo ufw allow 'Nginx HTTP'

## Add this two line in server block of Default Configuration

we can also use nginx as reverse proxy

sudo vim /etc/nginx/sites-available/default

```conf
location / {
    proxy_pass http://127.0.0.1:8000;
    include proxy_params;
}
```

## Checking configuration

sudo nginx -t
sudo systemctl restart nginx
sudo apt update
sudo apt install gunicorn
nano test.py

```python
def app(environ, start_response):
start_response("200 OK", [])
return iter([b"Hello, World!"])
```

gunicorn --workers=2 test:app
