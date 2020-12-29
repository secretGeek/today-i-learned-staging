# How do I check a DNS record?

How to do a dns lookup on wsl2 windows subsystem for windows.

(note -- if you want to see if a domain is registered, use [whois](./whois.md) instead)

	dig google.com

	; <<>> DiG 9.11.3-1ubuntu1.1-Ubuntu <<>> google.com
	;; global options: +cmd
	;; Got answer:
	;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 44434
	;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

	;; OPT PSEUDOSECTION:
	; EDNS: version: 0, flags:; udp: 4096
	;; QUESTION SECTION:
	;google.com.                    IN      A

	;; ANSWER SECTION:
	google.com.             298     IN      A       142.250.66.238

	;; Query time: 14 msec
	;; SERVER: 58.96.3.34#53(58.96.3.34)
	;; WHEN: Sat Oct 31 11:22:13 AEST 2020
	;; MSG SIZE  rcvd: 55