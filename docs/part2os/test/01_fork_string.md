# 1. Fork + String

Write a program, `executer.c`:

* `./executer "command0 argument00 argument01…" "command1 argument10 argument11 …" …`
* Over each "`command argument0  argument1 …`" string:
   * It runs `command` with arguments `argument0`, `argument1` …
   * It prints the _byte size_ of `command` _output_.

Shell example:

```bash
for C; do
    eval $C | wc -c
done
```

```bash
sh Fork_String.sh "ls -l /" "date" "cal" "cal -y"
1106
33
185
2448
```
