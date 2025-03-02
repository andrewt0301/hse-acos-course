Apache
---

Ejudge is based on Apache2 server. So, in some situations,
configuring Ejudge may involve dealing with Apache2 configuration and logs.

_NOTE: Ejudge may have up to 300 simultaneous users.
Default settings of Apache2 do not allow handling of such a large number.
So, it will be required to modify these settings._

### Getting Apache Information

```bash
apache2ctl -V
Server version: Apache/2.4.41 (Ubuntu)
Server built:   2020-08-12T19:46:17
Server's Module Magic Number: 20120211:88
Server loaded:  APR 1.6.5, APR-UTIL 1.6.1
Compiled using: APR 1.6.5, APR-UTIL 1.6.1
Architecture:   64-bit
Server MPM:     event
  threaded:     yes (fixed thread count)
    forked:     yes (variable process count)
Server compiled with....
 -D APR_HAS_SENDFILE
 -D APR_HAS_MMAP
 -D APR_HAVE_IPV6 (IPv4-mapped addresses enabled)
 -D APR_USE_SYSVSEM_SERIALIZE
 -D APR_USE_PTHREAD_SERIALIZE
 -D SINGLE_LISTEN_UNSERIALIZED_ACCEPT
 -D APR_HAS_OTHER_CHILD
 -D AP_HAVE_RELIABLE_PIPED_LOGS
 -D DYNAMIC_MODULE_LIMIT=256
 -D HTTPD_ROOT="/etc/apache2"
 -D SUEXEC_BIN="/usr/lib/apache2/suexec"
 -D DEFAULT_PIDLOG="/var/run/apache2.pid"
 -D DEFAULT_SCOREBOARD="logs/apache_runtime_status"
 -D DEFAULT_ERRORLOG="logs/error_log"
 -D AP_TYPES_CONFIG_FILE="mime.types"
 -D SERVER_CONFIG_FILE="apache2.conf"
```

NOTE: the Multi-Processing Module (MPM) being used is __event__:
```bash
apachectl -V | grep MPM
Server MPM:     event
```

### Apache Settings

Apache2 settings are stored in the `/etc/apache2/` folder.
The main Apache2 configuration file is `/etc/apache2/apache2.conf`.

Also, configuration related to system limits is stored in files:
* `mpm_event.conf` (see [docs](https://httpd.apache.org/docs/2.4/mod/event.html) on event module)
* `mpm_prefork.conf` (see [docs](https://httpd.apache.org/docs/2.4/mod/prefork.html) on prefork module)
* `mpm_worker.conf` (see [docs](https://httpd.apache.org/docs/2.4/mod/worker.html) on worker module)

The list of settings related to the number of users handled by Apache2
can be get using the command below.

If Apache2 used the `event` MPM,
the [MaxRequestWorkers](https://httpd.apache.org/docs/2.4/mod/mpm_common.html#maxrequestworkers)
setting must be increased in section `<IfModule mpm_event_module>`.

Let us try (`sudo nano /etc/apache2/mods-available/mpm_event.conf`):
```
MaxRequestWorkers	  300
```

The listing of default settings and their locations:
```bash
grep Max /etc/apache2/mods-available/*.conf -C 5
/etc/apache2/mods-available/mpm_event.conf-# event MPM
/etc/apache2/mods-available/mpm_event.conf-# StartServers: initial number of server processes to start
/etc/apache2/mods-available/mpm_event.conf-# MinSpareThreads: minimum number of worker threads which are kept spare
/etc/apache2/mods-available/mpm_event.conf:# MaxSpareThreads: maximum number of worker threads which are kept spare
/etc/apache2/mods-available/mpm_event.conf-# ThreadsPerChild: constant number of worker threads in each server process
/etc/apache2/mods-available/mpm_event.conf:# MaxRequestWorkers: maximum number of worker threads
/etc/apache2/mods-available/mpm_event.conf:# MaxConnectionsPerChild: maximum number of requests a server process serves
/etc/apache2/mods-available/mpm_event.conf-<IfModule mpm_event_module>
/etc/apache2/mods-available/mpm_event.conf-	StartServers			 2
/etc/apache2/mods-available/mpm_event.conf-	MinSpareThreads		 25
/etc/apache2/mods-available/mpm_event.conf:	MaxSpareThreads		 75
/etc/apache2/mods-available/mpm_event.conf-	ThreadLimit			 64
/etc/apache2/mods-available/mpm_event.conf-	ThreadsPerChild		 25
/etc/apache2/mods-available/mpm_event.conf:	MaxRequestWorkers	  150
/etc/apache2/mods-available/mpm_event.conf:	MaxConnectionsPerChild   0
/etc/apache2/mods-available/mpm_event.conf-</IfModule>
/etc/apache2/mods-available/mpm_event.conf-
/etc/apache2/mods-available/mpm_event.conf-# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
--
/etc/apache2/mods-available/mpm_prefork.conf-# prefork MPM
/etc/apache2/mods-available/mpm_prefork.conf-# StartServers: number of server processes to start
/etc/apache2/mods-available/mpm_prefork.conf-# MinSpareServers: minimum number of server processes which are kept spare
/etc/apache2/mods-available/mpm_prefork.conf:# MaxSpareServers: maximum number of server processes which are kept spare
/etc/apache2/mods-available/mpm_prefork.conf:# MaxRequestWorkers: maximum number of server processes allowed to start
/etc/apache2/mods-available/mpm_prefork.conf:# MaxConnectionsPerChild: maximum number of requests a server process serves
/etc/apache2/mods-available/mpm_prefork.conf-
/etc/apache2/mods-available/mpm_prefork.conf-<IfModule mpm_prefork_module>
/etc/apache2/mods-available/mpm_prefork.conf-	StartServers			 5
/etc/apache2/mods-available/mpm_prefork.conf-	MinSpareServers		  5
/etc/apache2/mods-available/mpm_prefork.conf:	MaxSpareServers		 10
/etc/apache2/mods-available/mpm_prefork.conf:	MaxRequestWorkers	  150
/etc/apache2/mods-available/mpm_prefork.conf:	MaxConnectionsPerChild   0
/etc/apache2/mods-available/mpm_prefork.conf-</IfModule>
/etc/apache2/mods-available/mpm_prefork.conf-
/etc/apache2/mods-available/mpm_prefork.conf-# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
--
/etc/apache2/mods-available/mpm_worker.conf-# worker MPM
/etc/apache2/mods-available/mpm_worker.conf-# StartServers: initial number of server processes to start
/etc/apache2/mods-available/mpm_worker.conf-# MinSpareThreads: minimum number of worker threads which are kept spare
/etc/apache2/mods-available/mpm_worker.conf:# MaxSpareThreads: maximum number of worker threads which are kept spare
/etc/apache2/mods-available/mpm_worker.conf-# ThreadLimit: ThreadsPerChild can be changed to this maximum value during a
/etc/apache2/mods-available/mpm_worker.conf-#			  graceful restart. ThreadLimit can only be changed by stopping
/etc/apache2/mods-available/mpm_worker.conf-#			  and starting Apache.
/etc/apache2/mods-available/mpm_worker.conf-# ThreadsPerChild: constant number of worker threads in each server process
/etc/apache2/mods-available/mpm_worker.conf:# MaxRequestWorkers: maximum number of threads
/etc/apache2/mods-available/mpm_worker.conf:# MaxConnectionsPerChild: maximum number of requests a server process serves
/etc/apache2/mods-available/mpm_worker.conf-
/etc/apache2/mods-available/mpm_worker.conf-<IfModule mpm_worker_module>
/etc/apache2/mods-available/mpm_worker.conf-	StartServers			 2
/etc/apache2/mods-available/mpm_worker.conf-	MinSpareThreads		 25
/etc/apache2/mods-available/mpm_worker.conf:	MaxSpareThreads		 75
/etc/apache2/mods-available/mpm_worker.conf-	ThreadLimit			 64
/etc/apache2/mods-available/mpm_worker.conf-	ThreadsPerChild		 25
/etc/apache2/mods-available/mpm_worker.conf:	MaxRequestWorkers	  150
/etc/apache2/mods-available/mpm_worker.conf:	MaxConnectionsPerChild   0
/etc/apache2/mods-available/mpm_worker.conf-</IfModule>
/etc/apache2/mods-available/mpm_worker.conf-
/etc/apache2/mods-available/mpm_worker.conf-# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
```

### Apache Logs

Apache2 logs are stored in folder `/var/log/apache2/`.
All interesting events are in the `access.log.*` file.
See full details [here](https://httpd.apache.org/docs/2.4/logs.html).

### Restarting Apache

Apache2 must be restarted after its settings have been modified.

Getting help on `apache2ctl`:
```bash
apache2ctl help
Usage: /usr/sbin/apache2ctl start|stop|restart|graceful|graceful-stop|configtest|status|fullstatus|help
       /usr/sbin/apache2ctl <apache2 args>
       /usr/sbin/apache2ctl -h            (for help on <apache2 args>)
```
Also, try `man apache2ctl`.

Restarting the Apache2 server:
```bash
sudo apache2ctl restart
```

Viewing the state after a restart:
```bash
apache2ctl fullstatus
```
