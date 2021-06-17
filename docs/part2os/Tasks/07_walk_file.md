# 6. Walk + File

Write a program `middle.c`:

* `./middle directory`
* Walks over all files in the `directory` (_not_ recursive).
* Prints out _middle line_ from any file
  (skipping other filesystem objects — directories, devices etc):
   * all files are treated as text ones (e. g. `/usr/share/bash4/` directory);
   * middle line is the line that _overlaps_ 1/2 of the file length or _starts_
     just at the 1/2 of the file.
