# Контрольная Работа: Операционные Системы

## Формула оценки

__Grade = 0.4 * Теория + 0.6 * Задача__

## Дедлайн

* __Время начала: 13:30__
* __Время окончания: 15:00__

## Правила

Разрешается использовать консоль Linux и все утилиты, которые оттуда можно вызвать.
Запрещается искать ответы в Интернете и использовать средства искусственного интеллекта.
Политика по борьбе с плагиатом описана [здесь](../grades.md#cheating-policy).

## Прокторинг

Запишите видео своего экрана + камера + звук при помощи [OBS Studio](https://obsproject.com), 
загрузите его в облако и пришите ссылку через форму. Рекомендуемый формат видео `.mkv` (должно получиться относительно небольшим). 

На видео должны быть обе части (теория и программа). Включите запись перед тем, как приступить к решению. Изображение с камеры поместить в верхний правый угол (размер ~1/8 экрана).

__Видео: Ссылку на видео отправить в эту [форму](https://forms.gle/L8NjE6kKZEjRfPZw6)__.

Форма для отправки видео останется открыта после окончания на случай, если загрузка
займёт длительное время.

## Форма

__Форма для отправки ответов [здесь](https://forms.gle/Yg56Xpgz89CJ9qbL9)__.

## Часть 1: Теория

Ответьте на вопросы по теории в форме для отправки ответов (см. выше).

## Часть 2: Задача по программированию

Пришлите программу через форму для отправки ответов (см. выше).

Write a program in C that does the following:

* Calculates the value of the specified function `f(x)` in the range from `argv[1]` to `argv[2]` with step `argv[3]`.
* Writes pairs `x, f(x)` into text file `output.csv` ([CSV](https://en.wikipedia.org/wiki/Comma-separated_values) format).  
* The function to be calculated has the following format:
  ``` 
  f(x) = f0(f1(x), f2(x), f3(x), f4(x))
  ```
  , where:
    * `x` is the function argument;
    * `f0`-`f4` are functions that are individual according to the variant.

### Example of Function (you need your variant, see below)

_Note_: the `^` symbol means "power".

    f0(a, b, c, d) = (a - b + c - d) / 2
    f1(x) = 2*x^3 - 4*x^2 + 3*x + 1
    f2(x) = sin(5*x)*4 + 3
    f3(x) = 1 / (1 + e^(-7*x))
    f4(x) = 2^x + 5

### Requirements and Grades

* ___4 Points___:
  make all calculations and write to file in a __parent__ process;
  provide a Makefile to build the program;
* ___5 Points___:
  write to a file using output redirection (redirect the standard output
  to the file using [dup2](https://man7.org/linux/man-pages/man2/dup.2.html));
* ___6 Points___:
  make all calculations and write to the file in a __child__ process
  (use [fork](https://man7.org/linux/man-pages/man2/fork.2.html));
* ___8 Points___:
  execute the __f0__ function for the entire value range in a __child__ process
  and send the resulting values to the parent process using
  a [pipe](https://man7.org/linux/man-pages/man2/pipe.2.html);
* ___10 Points___:
  execute __f0__ in the __parent__ process and __f1__-__f4__ in separate __child__ processes;
  return the calculated values of __f1__-__f4__ to __f0__ using a pipe (you will need 4 pipes).

### Hints

* Function `f0` have the following  structure:
  ```c
  double f0(double a, double b, double c, double d) {
      return <math expr>;
  }
  ```
* Functions `f1`-`f4` have the following  structure:
  ```c
  double f1(double x) {
      return <math expr>;
  }
  ```
* Command-line arguments (strings) can be converted to `double` using the [atof](
  https://man7.org/linux/man-pages/man3/atof.3.html) function.
* Mathematical functions (such as `sin`, `cos`, `pow`, `exp` etc.) and constants (`M_E`) are in the [math.h](
  https://man7.org/linux/man-pages/man0/math.h.0p.html) library.
  The program must be linked with the library: use the `-lm` GCC flag.
* To write to a file, [open](https://man7.org/linux/man-pages/man2/open.2.html) the file and redirect the standard output
  (`STDOUT_FILENO`) to this file with the [dup2](https://man7.org/linux/man-pages/man2/dup.2.html) system call.
  When you do this, you will be able to use `printf` to print to the file. If you do this in the parent process,
  redirection will work in both processes (parent and child).
* Sending data from child to parent using a pipe: see example in the [manual](
  https://man7.org/linux/man-pages/man2/pipe.2.html).
  * _Child_: `f(x)` is calculated for a range of values and results (`x` and `f(x)`) are written (`write(pfd[1], &x, sizeof(x))`) to the pipe;
  * _Parent_: results (`x` and `f(x)`) are read (`read(pfd[0], &x, sizeof(x))`) from the pipe in a loop and printed.

### Варианты

Выберите __свой номер варианта__ согласно своему номеру в списке группы.

Списки групп:

* [КНАД 241](https://docs.google.com/spreadsheets/d/1tZlR7uy-3mURQFg42oKZTIsyqto1ww6CELghykmZplw/edit?usp=sharing)
* [КНАД 242](https://docs.google.com/spreadsheets/d/1bb6kav3XQVu1nbS-T2jY3tNvBIz3-TkHf5PWZeX3ppc/edit?usp=sharing)

Варианты для групп:

* [КНАД 241](variants_2026_compds241.md)
* [КНАД 242](variants_2026_compds242.md)
   