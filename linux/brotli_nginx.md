# How to enable Brotli compression in nginx on ubuntu

This is useful if (for example) Google Lighthouse gives you this message:

> Text-based resources should be served with compression (gzip, deflate or brotli) to minimize total network bytes.


Brotli reduces file sizes more than the other compression algorithms.




	sudo apt-add-repository -y ppa:hda-me/nginx-stable
	sudo apt-get update
	sudo apt-get install brotli nginx nginx-module-brotli

(the step above it different if you don't have apt-get... there's a yum equivalent, and a 'download and unzip' equivalent too.


Edit your nginx.conf file --

e.g. 

	sudo nano /etc/nginx/nginx.conf


Load the module when nginx restarts, by adding these lines:

	load_module modules/ngx_http_brotli_filter_module.so;
	load_module modules/ngx_http_brotli_static_module.so;


Now locate the nginx config file specific to your site. e.g. it should be in `/etc/nginx/sites-available/`


 
	 # gzip
	gzip on;
	gzip_vary on;
	gzip_proxied any;
	gzip_comp_level 6;
	gzip_types text/plain text/css text/xml application/json application/javascript application/xml+rss application/atom+xml image/svg+xml;

	# brotli
	brotli on;
	brotli_comp_level 6;
	brotli_types text/xml image/svg+xml application/x-font-ttf image/vnd.microsoft.icon application/x-font-opentype application/json font/eot application/vnd.ms-fontobject application/javascript font/otf application/xml application/xhtml+xml text/javascript  application/x-javascript text/plain application/x-font-truetype application/xml+rss image/x-icon font/opentype text/css image/x-win-bitmap;
	Nginx web server needs a restart for the static contents to be compressed.





	sudo systemctl restart nginx