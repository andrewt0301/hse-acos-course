Updading Ejudge Tasks and Deadlines
---

Ejudge configuration files are stored in a private GitHub repo (you need to be added as a collaborator):

https://github.com/andrewt0301/hse-acos-course-private/tree/main/ejudge/configs

File names typically match group names (e.g. `000241.cfg`).

Task configuration looks like this:
```
[problem]
super = "Generic"
short_name = "BasicArithm"
long_name = "BasicArithm"
problem_dir = "BasicArithm"
standard_checker = "cmp_int_seq"
enable_language = "rars"
open_tests="1-100:full"
start_date = "2026/01/22 00:00:00"
date_penalty = "2026/01/26 23:59:59 0"
date_penalty = "2026/07/01 23:59:59 0-25/7d"
deadline = "2026/07/01 23:59:59"
run_penalty = 0
```

To change a _deadline_, update this line:
```
date_penalty = "2026/01/26 23:59:59 0"
```

To add a _new task_, check the configurations of previous years and copy from there.
Replace all dates with relevant ones.

Connect to Ejudge server via SSH:
```bash
ssh login@ipaddress -p22
```

Pull updated configuration from GitHub:
```bash
cd /home/ejudge/hse-acos-course-private
su ejudge
git pull origin
```

Go to the admin page of Ejudge (`http://ipaddress/cgi-bin/serve-control`) and select "Master" for your contest. Click button "Reload config files" or "Reload config files for ALL contests". 