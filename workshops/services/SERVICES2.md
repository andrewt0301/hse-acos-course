Services. Part 2.
---

See the systemd journal:

    andrewt@comp-core-i7-3615qm-0dbf32 ~ $ journalctl -r -u echosrv.service

## Creating a service for hexdump

Create a service unit for hexdump:

    andrewt@comp-core-i7-3615qm-0dbf32 ~ $ su -
    Password: 
    comp-core-i7-3615qm-0dbf32 ~ # mcedit /etc/systemd/system/hexdump@.service

 With the following content:
 
    [Unit]
    Description=Hexdump service
    After=network.target

    [Service]
    Type=simple
    ExecStart=/usr/bin/hexdump -C
    StandardInput=socket

    [Install]
    WantedBy=default.target

Create a socket unit for hexdump:

    comp-core-i7-3615qm-0dbf32 ~ #  mcedit /etc/systemd/system/hexdump.socket

 With the following content:

    [Unit]
    Description=Soketizing Hexdump

    [Socket]
    ListenStream=1616
    Accept=yes
    
    [Install]
    WantedBy=sockets.target
    
Verify the created service units:

    comp-core-i7-3615qm-0dbf32 ~ # systemd-analyze verify hexdump@.service
    /lib/systemd/system/alteratord.socket:6: ListenStream= references a path below legacy directory /var/run/, updating /var/run/alteratord/.socket → /run/alteratord/.socket; please update the unit file accordingly.
    /lib/systemd/system/smb.service:10: PIDFile= references a path below legacy directory /var/run/, updating /var/run/smbd.pid → /run/smbd.pid; please update the unit file accordingly.
    /lib/systemd/system/winbind.service:9: PIDFile= references a path below legacy directory /var/run/, updating /var/run/winbindd.pid → /run/winbindd.pid; please update the unit file accordingly.
    /lib/systemd/system/nmb.service:10: PIDFile= references a path below legacy directory /var/run/, updating /var/run/nmbd.pid → /run/nmbd.pid; please update the unit file accordingly.
    /lib/systemd/system/chronyd.service:10: PIDFile= references a path below legacy directory /var/run/, updating /var/run/chrony/chronyd.pid → /run/chrony/chronyd.pid; please update the unit file accordingly.

Start the serice and check its status:

    comp-core-i7-3615qm-0dbf32 ~ # systemctl start hexdump.socket
    comp-core-i7-3615qm-0dbf32 ~ # systemctl status  hexdump.socket
    ● hexdump.socket - Soketizing Hexdump
       Loaded: loaded (/etc/systemd/system/hexdump.socket; disabled; vendor preset: disabled)
       Active: active (listening) since Mon 2020-05-18 01:02:11 MSK; 1min 12s ago
       Listen: [::]:1616 (Stream)
     Accepted: 0; Connected: 0;
        Tasks: 0 (limit: 2361)
       Memory: 12.0K
       CGroup: /system.slice/hexdump.socket
    
    May 18 01:02:11 comp-core-i7-3615qm-0dbf32 systemd[1]: Listening on Soketizing Hexdump.

See who is listening to sockets:

    comp-core-i7-3615qm-0dbf32 ~ # netstat -ltp 
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address               Foreign Address     State       PID/Program name
    tcp        0      0 *:netbios-ssn               *:*                 LISTEN      2346/smbd   
    tcp        0      0 localhost.localdomai:domain *:*                 LISTEN      2915/dnsmasq
    tcp        0      0 *:ssh                       *:*                 LISTEN      2075/sshd
    tcp        0      0 localhost.localdomain:ipp   *:*                 LISTEN      2047/cupsd
    tcp        0      0 *:microsoft-ds              *:*                 LISTEN      2346/smbd
    tcp        0      0 *:netbios-ssn               *:*                 LISTEN      2346/smbd
    tcp        0      0 *:1616                      *:*                 LISTEN      1/init
    tcp        0      0 localhost:domain            *:*                 LISTEN      2915/dnsmasq
    tcp        0      0 *:ssh                       *:*                 LISTEN      2075/sshd
    tcp        0      0 localhost:ipp               *:*                 LISTEN      2047/cupsd
    tcp        0      0 *:microsoft-ds              *:*                 LISTEN      2346/smbd

Test the service:

    comp-core-i7-3615qm-0dbf32 ~ # netcat localhost 1616
    Hello World!
    00000000  48 65 6c 6c 6f 20 57 6f  72 6c 64 21 0a           |Hello World!.|
    0000000d

While a connection is active, check service status:

    comp-core-i7-3615qm-0dbf32 ~ # systemctl | grep hex
      hexdump@6-127.0.0.1:1616-127.0.0.1:53340.service         loaded active running   Hexdump service (127.0.0.1:53340)                              
      system-hexdump.slice                                     loaded active active    system-hexdump.slice                                            
      hexdump.socket                                           loaded active listening Soketizing Hexdump
      
Close the connection and check the status again:

    comp-core-i7-3615qm-0dbf32 ~ # systemctl | grep hex
      system-hexdump.slice                                     loaded active active    system-hexdump.slice                                                         
      hexdump.socket                                           loaded active listening Soketizing Hexdump

See systemd journal:

    comp-core-i7-3615qm-0dbf32 ~ # journalctl -r -n 4
    -- Logs begin at Sun 2020-04-19 06:24:19 MSK, end at Mon 2020-05-18 01:29:05 MSK. --
    May 18 01:29:05 comp-core-i7-3615qm-0dbf32 systemd[1]: hexdump@8-127.0.0.1:1616-127.0.0.1:53344.service: Succeeded.
    May 18 01:29:02 comp-core-i7-3615qm-0dbf32 systemd[1]: Started Hexdump service (127.0.0.1:53344).
    May 18 01:28:42 comp-core-i7-3615qm-0dbf32 systemd[1]: hexdump@7-127.0.0.1:1616-127.0.0.1:53342.service: Succeeded.
    May 18 01:28:36 comp-core-i7-3615qm-0dbf32 systemd[1]: Started Hexdump service (127.0.0.1:53342).

## Modifying the TCP echo service (tasks)

1. Print diagnostics messages to stderr and see systemd journal.
2. Read entire message instead of 32 bytes.
3. Implement forking.

## Homework

Finish all the tasks:

1. Create folder '07_Services2' at sugon.
2. Put there the updated 'tcp_echo_serverSR.c' file.
3. Save systemd journal with events related to the services into text files
   and upload them to sugon.

   Hexdump service:
   
       andrewt@comp-core-i7-3615qm-0dbf32 ~ $ journalctl -r | grep hexdump > hexdump.journal

   TCP echo service:
   
       andrewt@comp-core-i7-3615qm-0dbf32 ~ $ journalctl -r -u echosrv.service > echosrv.journal
