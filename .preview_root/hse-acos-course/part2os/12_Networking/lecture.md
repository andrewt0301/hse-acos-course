Lecture 12
---

# Basics of Networking

## Lecture

Slides ([PDF](OS_Lecture_12.pdf), [PPTX](OS_Lecture_12.pptx)).

<!---
Outline:
-->

## Workshop

<!---
* [Part 1](workshop1.md).
* [Part 2](workshop2.md).
-->

Using the [wget](https://en.wikipedia.org/wiki/Wget) utility to download files (via HTTPS):
```bash
wget https://andrewt0301.github.io/hse-acos-course/part2os/12_Networking/OS_Lecture_12.pdf
--2025-06-01 23:01:58--  https://andrewt0301.github.io/hse-acos-course/part2os/12_Networking/OS_Lecture_12.pdf
Resolving andrewt0301.github.io (andrewt0301.github.io)... 185.199.110.153, 185.199.111.153, 185.199.108.153, ...
Connecting to andrewt0301.github.io (andrewt0301.github.io)|185.199.110.153|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1338083 (1.3M) [application/pdf]
Saving to: ‘OS_Lecture_12.pdf’

OS_Lecture_12.pdf                         100%[====================================================================================>]   1.28M   801KB/s    in 1.6s    

2025-06-01 23:02:00 (801 KB/s) - ‘OS_Lecture_12.pdf’ saved [1338083/1338083]
```

Using the [curl](https://en.wikipedia.org/wiki/CURL) utility to download files (via HTTPS):
```bash
curl https://andrewt0301.github.io/hse-acos-course/part2os/12_Networking/OS_Lecture_12.pdf -O
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1306k  100 1306k    0     0  1008k      0  0:00:01  0:00:01 --:--:-- 1008k
```

Viewing standard ports for various services:
```bash
cat /etc/services | grep http
# Updated from https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml .
http		80/tcp		www		# WorldWideWeb HTTP
https		443/tcp				# http protocol over TLS/SSL
https		443/udp				# HTTP/3
http-alt	8080/tcp	webcache	# WWW caching service
```

Viewing/editing the [/etc/hosts](https://en.wikipedia.org/wiki/Hosts_%28file%29) file: 
```bash
cat /etc/hosts
127.0.0.1	localhost
127.0.1.1	huawei-ThinkPad-T490s
158.160.144.239	ejudge

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

Querying DNS with [nslookup](https://en.wikipedia.org/wiki/Nslookup):
```bash
nslookup hse.ru
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	hse.ru
Address: 178.248.234.104
```

Querying information on an IP address with [whois](https://en.wikipedia.org/wiki/WHOIS):
```bash
whois 89.175.46.44
% This is the RIPE Database query service.
% The objects are in RPSL format.
%
% The RIPE Database is subject to Terms and Conditions.
% See https://docs.db.ripe.net/terms-conditions.html

% Note: this output has been filtered.
%       To receive output for a database update, use the "-B" flag.

% Information related to '89.175.46.0 - 89.175.46.255'

% Abuse contact for '89.175.46.0 - 89.175.46.255' is 'abuse@mtu.ru'

inetnum:        89.175.46.0 - 89.175.46.255
netname:        NRUHSE
descr:          National Research University Higher School of Economics
country:        RU
admin-c:        MTU1-RIPE
tech-c:         MTU1-RIPE
status:         ASSIGNED PA
mnt-by:         MTU-NOC
created:        2022-02-04T07:55:18Z
last-modified:  2022-02-04T07:55:18Z
source:         RIPE

role:           MTS backbone NOC
address:        PJSC MTS / former CJSC Comstar-Direct
address:        Petrovsky blvd 12, bldg 3
address:        P.O. BOX 4711 127051
address:        Moscow, Russia
remarks:        **************************************
remarks:        Contact addresses:
remarks:        routing & peering noc@mtu.ru
remarks:        spam & security abuse@mtu.ru
remarks:        mail postmaster@mtu.ru
remarks:        ddos reports ddos-reports@mtu.ru
remarks:        **************************************
phone:          +7 495 721-34-99
fax-no:         +7 495 956-07-07
admin-c:        EDA-RIPE
admin-c:        RPS-RIPE
tech-c:         EDA-RIPE
nic-hdl:        MTU1-RIPE
mnt-by:         MTU-NOC
created:        2002-10-18T13:29:19Z
last-modified:  2022-04-08T13:50:05Z
source:         RIPE # Filtered

% Information related to '89.175.0.0/16AS8359'

route:          89.175.0.0/16
descr:          MTS PJSC
origin:         AS8359
mnt-by:         MTU-NOC
created:        2016-06-04T18:36:17Z
last-modified:  2024-06-06T12:06:50Z
source:         RIPE # Filtered

% This query was served by the RIPE Database Query Service version 1.117 (DEXTER)
```

Analyze TCP packets with the [tcpdump](https://en.wikipedia.org/wiki/Tcpdump) tool:
```bash
sudo tcpdump host 158.160.144.239 -v
```

## Homework

__TODO__

## References

* Network Programming. Chapter 11 in [[CSPP]](../../books.md)
* Sockets: Fundamentals Of TCP/IP Networks. Chapter 58 in [[TLPI]](../../books.md)
* [TCP/IP](https://en.wikipedia.org/wiki/Internet_protocol_suite) (Wikipedia)
* [DNS](https://en.wikipedia.org/wiki/Domain_Name_System) (Wikipedia)
 