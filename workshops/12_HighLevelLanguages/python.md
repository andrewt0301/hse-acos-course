System Programming in Python
---

The goal of this seminar is to practice in using Pythons that manage facilities
provided by the operation system. 

1. Using the [os](https://docs.python.org/3/library/os.html) and
   [sys](https://docs.python.org/3/library/sys.html) modules to run programs from Python scripts.

   Read documentation on the `os.path.realpath(path)`, `os.system(command)`, `sys.executable`,
   and `sys.argv` methods.

   Study [this](15-57_dorun.py) example and run it:
   
       python3 15-57_dorun.py 15-58_torun.py qwe ert ert


See the programs in Python [here](.).

## Homework

1. Create the '12_HighLevelLanguages' folder at the 'sugon' server.

2. Run every program. Understand what it does. If necessary fix it.
   Save the program output to the 'sugon' server.



---


George Kouryachy, [31 May 2020, 20:50:28]:
ща гляну, я там намекал, где писать, где копипакстить, но мутно

15-57 объяснить и показать
16-12 и 18-21 задачи (можно напомнить что такое sys.stderr и показать, где читать про subprocess.run)
16-43 задача: модифицировать пример (для тупых объяснить почему @)
16-50 объяснить 
16-58 задача: модифицировать пример (простой)
17-07 разобрать пример и задача: дописать в предыдущий
17-11 объяснить про start и join, задача — несколько процессов (объяснить, что тупо сначала все создать, потом все запустить, потом всех дождаться)
17-17 надо успеть обязательно объяcнить про Pool (возможно, ценой каких-то предыдущих заданий)

Надо придумать какое-то осмысленное Д/З, в котором вычислительно сложная задача решалась бы над массивом.


5-57_dorun.py — исследовательская задача. Все очень тупили. НЕ умеют они работать с документацией Python. Видимо, надо объяснить, почему так (realpath необязателен, на саом деле) и показать

george@inspiron:~/src/12_HighLevelLanguages> python3 15-57_dorun.py 15-58_torun.py qwe ert ert
: qwe-ert-ert

16-12_dochkrun.py — проверить. что фаёл есть и вывести диагностику на stderr

16-21_dosubrun.py
то же, но с использованием subprocess (не надо использовать os.system)

16-43_pipecmd.py 
https://docs.python.org/3.8/library/subprocess.html?highlight=subprocess#replacing-shell-pipeline
пример отсюда, но программа должна вводить из командной строки обе команды

george@inspiron:~/src/12_HighLevelLanguages> python3 16-43_pipecmd.py date -u @ hexdump -C
00000000  d0 a1 d1 80 20 d0 bc d0  b0 d1 8f 20 32 37 20 31  |.... ...... 27 1|
00000010  34 3a 35 39 3a 33 35 20  55 54 43 20 32 30 32 30  |4:59:35 UTC 2020|
00000020  0a                                                |.|
00000021

то есть быть аналогом date -u | hexdump -C

16-50_multiex.py
тупо пример отсюда, просто должен заработать
https://docs.python.org/3.8/library/multiprocessing.html#the-process-class

16-58_multiex2.py
взять предыдущий пример с сайта и добавить в него случайное ожидание,  и печать до ожидания

17-07_multiexchat.py
Разобрать второй пример отсюда 
https://docs.python.org/3.8/library/multiprocessing.html#exchanging-objects-between-processes
+ добавить в предыдущую прогармм, чтобы эти параметры в дочернюю программу посылались , а потом получался результат
Pipe — это не Pipe. Это сокет, скорее всего. От ОС зависит

17-11_multiexmany.py
Создать несколько процессов,
Запустить несколько процессов, 
Дождаться окончания каждого
Можно в параллельном терминале ps -ef | grep python :)

17-17_multiexpool.py
Простейший диспетчер. Запустить N просцессов и скормить им на решение M>N данных для функции

Все объекты надо делать close(), особенно pool, потому что он не закрывается при простом удалении

Диспетчер надо объяснить хотя бы. И оставить на ДЗ.

Некоторые мои проявили невероятный по сравнению с предыдущими темами интерес и ещё час (!) висели в zoom, подробности выясняли.