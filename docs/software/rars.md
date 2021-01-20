RARS
---

__RARS__ in a RISC-V assembler and runtime simulator. It is used in this course
to create, assemble and simulate assembly programs for RISC-V microprocessors.

The home page of the RARS project is [here](https://github.com/TheThirdOne/rars).
In case the project becomes unavailable, here is a [fork](https://github.com/andrewt0301/rars).

## Downloading and Installing

### Java 

RARS is a Java application that works under any desktop operating system (Windows, MacOS, Linux).
It requires Java 8 or higher to be installed. The most recent Java version can be downloaded
from [here](https://www.oracle.com/java/technologies/javase-downloads.html).
Older versions of Java can be found [here](
https://www.oracle.com/java/technologies/oracle-java-archive-downloads.html).
To install, run the downloaded installation package (.exe, .prm, .dmg).

### RARS

RARS can be downloaded from its [home page](https://github.com/TheThirdOne/rars).
Follow the _Releases_ link at the right.
This is JAR-file that has a name like `rars1_5.jar`.
Download it to the folder where you store course-related files.

#### Linux and MacOS

In Linux and MacOS, RARS can be run with the following command:

    (base) Andreis-MacBook-Pro:Downloads andrew$ java -jar rars1_5.jar 

For convenience, you can create the following Bash script and use it to run RARS.

rars.sh:

    #!/bin/bash
    java -jar rars1_5.jar 

Running a Bash script:

    (base) Andreis-MacBook-Pro:Downloads andrew$ sh rars.sh 

Also, `rars.sh` can be made an executable file:

    (base) Andreis-MacBook-Pro:Downloads andrew$ chmod +x rars.sh

Then you can run it with this command:

    (base) Andreis-MacBook-Pro:Downloads andrew$ ./rars.sh

#### Windows

* Download RARS (the `rars1_5.jar` file) to your disk. For example, to the `D:\` folder (we will call it RARS folder).
* Open the _Command Prompt_ application (to find it, type `cmd` in the search field).
* In _Command Prompt_, go to the RARS folder:
    
      D:
      cd D:

* Run RARS with this command:

      java -jar rars1_5.jar
