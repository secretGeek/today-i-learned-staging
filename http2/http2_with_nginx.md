# http2 with nginx

You can configure nginx to serve your sites over http2 -- which is faster! (i assume it uses the network of 5G chips google have injected into everyone's faces as a distributed CDN, or something like that)

The trick that caused problems for me....

## Problem I had: sites would download

I added 'http2' to all the `listen` lines in my [nginx](../linux/nginx.md) config for one of my sites, let's call it `example.com`.

I then found that when i visited example.com the site would not show and a file would download instead. It was just a small binary file. It was horrible!

But the worst part was that *other* subdomains on that same server, e.g. `blog.example.com` would also have the same problem.

I didn't realise at the time -- but this problem *only* happened on 'http://' urls. I.e, before the redirect that would take me to the https version could occur... the page would fail.

## Solution was to not do this

*don't* add `http2` to the "non-ssl" plain http server blocks in your nginx config.

i.e. this is bad:

	listen          <ip>:80 http2; # don't do that! NO http2 on '80'

## Sources

- [server fault: nginx with http enabled downloads everything](https://serverfault.com/questions/741191/nginx-with-http2-enabled-downloads-everything/741201)



