# План перевода курса ACOS на русский

> Цель: получить параллельную русскую версию материалов курса
> «Computer Architecture and Operating Systems» c рабочим переключателем
> языков (EN ⇄ RU) и поддержанной синхронизацией с upstream.
>
> Всего файлов в `docs/`: ~155 markdown. Это большой объём;
> план разбит на этапы по приоритету. Можно идти по нему сверху вниз —
> каждый этап даёт самостоятельную ценность.

---

## 0. Подготовка и стратегия

- [ ] Решить, как хранить переводы (выбрать один вариант):
  - [ ] **A. Параллельная папка** `docs/ru/...` — зеркальная структура (`docs/ru/index.md`, `docs/ru/part1ca/01_Introduction/lecture.md` и т. д.). Рекомендуется как самый простой и совместимый с GitHub Pages.
  - [ ] **B. Суффикс языка** в имени файла: `lecture.md` / `lecture.ru.md`. Меньше дублирования путей, но нужен Jekyll-плагин или ручная маршрутизация.
  - [ ] **C. Плагин `jekyll-multiple-languages-plugin`** — централизованно, но не работает на GitHub Pages без CI.
- [ ] Создать `GLOSSARY.md` со словарём терминов (см. раздел 1.3 ниже)
- [ ] Согласовать стилистику: «вы»/«ты», степень формальности, как переводить англицизмы, оставлять ли термины в скобках на английском (например, «конвейер (pipeline)»)
- [ ] Описать процесс перевода в `CONTRIBUTING.md` (для возможных сторонних контрибьюторов)
- [ ] Завести шаблон front matter для русских файлов (`title:`, `lang: ru`, `permalink: /ru/...`)

### 0.1. Глоссарий технических терминов

Минимальный набор, который должен быть согласован до начала перевода лекций.
Каждая пара — английский → русский. Помечать те, по которым ещё нет решения.

- [ ] `instruction` → инструкция
- [ ] `instruction set / ISA` → система команд / архитектура системы команд (ISA)
- [ ] `assembly language / assembler` → язык ассемблера / ассемблер
- [ ] `pipeline / pipelining` → конвейер / конвейеризация
- [ ] `branch / branching` → переход / ветвление (определиться по контексту)
- [ ] `cache (line / set / way / hit / miss)` → кэш (строка / набор / канал / попадание / промах)
- [ ] `virtual memory / page table / TLB` → виртуальная память / таблица страниц / TLB (буфер ассоциативной трансляции)
- [ ] `interrupt / exception / trap` → прерывание / исключение / ловушка
- [ ] `system call / syscall` → системный вызов
- [ ] `process / thread / context switch` → процесс / поток / переключение контекста
- [ ] `synchronization / mutex / semaphore / spinlock` → синхронизация / мьютекс / семафор / спинлок
- [ ] `IPC (inter-process communication)` → межпроцессное взаимодействие (IPC)
- [ ] `linker / linking / loader / loading` → компоновщик / компоновка / загрузчик / загрузка
- [ ] `out-of-order / superscalar / VLIW` → внеочередное исполнение / суперскалярный / VLIW
- [ ] `SIMD / vectorization` → SIMD / векторизация
- [ ] `floating-point` → числа с плавающей запятой / плавающая запятая (придерживаться одного варианта)
- [ ] `byte order / endianness` → порядок байтов / порядок следования байтов
- [ ] `stack / heap / call frame` → стек / куча / кадр вызова
- [ ] `permission / privilege` → права / привилегии
- [ ] `socket / networking` → сокет / сетевое взаимодействие
- [ ] `file descriptor / inode` → файловый дескриптор / индексный дескриптор (inode)
- [ ] `bootloader / kernel / userspace` → загрузчик ОС / ядро / пользовательское пространство
- [ ] `register / register file` → регистр / регистровый файл
- [ ] `memory hierarchy / locality` → иерархия памяти / локальность
- [ ] `optimization / compiler` → оптимизация / компилятор

---

## 1. Инфраструктура локализации

- [ ] Развести страницы по языкам в `_layouts/default.html`: использовать `page.lang` (`en` / `ru`) и условно подставлять локализованные строки
- [ ] Сделать переключатель EN/RU реальным (сейчас он только показывает заглушку): кликнул RU → редирект на парный URL в `/ru/...`
- [ ] Реализовать fallback: если русской версии страницы нет — показывать английскую с баннером «перевод в работе»
- [ ] Добавить `<link rel="alternate" hreflang="...">` в `<head>` для пар страниц
- [ ] Удалить блок `language-placeholder` после полной локализации хотя бы базовых страниц
- [ ] Прописать `lang="ru"` на `<html>` для русских страниц (сейчас только глобальный JS меняет — должно быть статически)
- [ ] Локализовать данные навигации `_data/navigation.yml`: либо два файла (`navigation.yml` / `navigation_ru.yml`), либо вложенные ключи `title_en` / `title_ru`
- [ ] Добавить переключатель в `breadcrumbs` (русская версия должна вести «Главная / Раздел / Страница»)

### 1.1. UI-строки в шаблоне

Это всё в `docs/_layouts/default.html` и `docs/assets/js/site.js`:

- [ ] `Skip to content` → «Перейти к содержимому»
- [ ] `Menu` (кнопка-гамбургер) → «Меню»
- [ ] `Primary` (aria-label навигации) → «Основная навигация»
- [ ] `Theme` / `Light` / `Dark` → «Тема» / «Светлая» / «Тёмная»
- [ ] `Lang` / `EN` / `RU` → «Язык» / «EN» / «RU»
- [ ] `Site preferences`, `Theme switch`, `Language switch` (aria-label) — перевести
- [ ] `Home` (breadcrumb) → «Главная»
- [ ] `On this page` (TOC eyebrow) → «На этой странице»
- [ ] `Open repository` (ссылка) → «Открыть репозиторий»
- [ ] `Course Register` → «Карточка курса»
- [ ] `Modules / Tracks / Stack / Format` → «Модули / Треки / Стек / Формат»
- [ ] `03 / 04`, `Architecture / OS`, `RISC-V / Linux / C`, `Lectures / Workshops` — оставить или дать русские эквиваленты
- [ ] `Hardware reference: SiFive HiFive Unleashed` (figcaption) → «Эталонное железо: SiFive HiFive Unleashed»
- [ ] `Course Access`, `Program Links`, `Repository` (rail panel заголовки) → «Доступ к курсу / Программные ссылки / Репозиторий»
- [ ] Ссылки в quick_access (`Calendar / Grades / Exam / Software / Textbooks`) и подписи (`Weekly plan / Grading system / Latest questions / Tools and setup / Core references`)
- [ ] Подписи треков: `Module 3 / Module 4`, `Lecture sequence`, кнопки `Homeworks / Final test`
- [ ] Карточки support: `Additional Chapters / Assessment / Related Materials` и тексты внутри
- [ ] `Module 3 release notes` (плейсхолдеры) — перевести
- [ ] Заглушка языка `Русская версия пока в разработке` — оставить только если будет нужна, иначе убрать
- [ ] `Back to English` (кнопка сброса языка) → «Вернуться к английскому»
- [ ] Подписи в footer: `Course materials maintained on GitHub Pages...`, ссылки `Home / Repository / GitHub Pages`
- [ ] Лейблы код-блоков (`docs/assets/js/site.js`): `Copy` / `Copied` → «Копировать» / «Скопировано»
- [ ] Авто-лейбл `CODE` (когда язык код-блока не определён) → «КОД»

### 1.2. Конфигурация сайта

- [ ] `_config.yml`: продумать русский вариант `title` и `description`
- [ ] Добавить `<title>` страниц на русском (сейчас берётся из `page.title`)
- [ ] Локализовать `<meta name="description">` для русских страниц
- [ ] Решить, нужны ли отдельные OG/Twitter мета-теги для русской версии

---

## 2. Корневые страницы (`docs/*.md`)

Высокий приоритет — это первое, что попадается на глаза.

- [ ] `docs/index.md` — главная страница (короткий редакционный текст: Scope/Structure/This Site/Feedback)
- [ ] `docs/calendar.md`
- [ ] `docs/calendar_plan.md` — недельный план
- [ ] `docs/calendar_2022.md` (архивный — низкий приоритет)
- [ ] `docs/exam.md` — формат экзамена
- [ ] `docs/exam_latest.md` — текущий список вопросов
- [ ] `docs/exam_2019.md` (архивный)
- [ ] `docs/exam_2020.md` (архивный)
- [ ] `docs/exam_zscore.md` — описание Z-score
- [ ] `docs/grades.md` — система оценок
- [ ] `docs/books.md` — учебники (имена и аннотации, цитаты в скобках можно оставить в оригинале)
- [ ] `docs/courses.md` — связанные курсы
- [ ] `docs/links.md` — полезные ссылки
- [ ] `docs/software.md` — индекс ПО

---

## 3. Установка и настройка ПО (`docs/software/*.md`)

- [ ] `docs/software/git.md`
- [ ] `docs/software/rars.md`
- [ ] `docs/software/ubuntu.md`
- [ ] `docs/software/ubuntu_install.md`
- [ ] `docs/software/bash.md`
- [ ] `docs/software/cloud_ssh.md`
- [ ] `docs/software/cloud_users.md`
- [ ] `docs/software/cloud_newuser.md`
- [ ] `docs/software/ejudge/ejudge.md`
- [ ] `docs/software/ejudge/apache.md`
- [ ] `docs/software/ejudge/users.md`
- [ ] `docs/software/ejudge/update.md`

---

## 4. Лекции по архитектуре (`docs/part1ca/`) — модуль 3

Основной образовательный материал. Переводить в порядке прохождения курса.

### 4.1. Лекции

- [ ] `01_Introduction/lecture.md` — введение, мотивация, история
- [ ] `02_DataTypes/lecture.md` — типы данных, порядок байтов, целые
- [ ] `03_CPU/lecture.md` — устройство CPU, RISC и RISC-V
- [ ] `04_Instructions/lecture.md` — инструкции RISC-V, форматы
- [ ] `05_MacrosBranchesArrays/lecture.md` — псевдоинструкции, ветвления, массивы
- [ ] `06_CallStack/lecture.md` — стек вызовов, calling convention
- [ ] `06_CallStack/toolchain.md` — toolchain
- [ ] `07_FP/lecture.md` — числа с плавающей запятой, IEEE 754
- [ ] `08_Caches/lecture.md` — память и кэши
- [ ] `09_VM/lecture.md` — виртуальная память
- [ ] `09_VM/pseudovm.md` — псевдо-VM
- [ ] `10_Pipeline/lecture.md` — процессор и конвейер
- [ ] `11_Exceptions/lecture.md` — исключения и прерывания
- [ ] `12_MMIO/lecture.md` — ввод-вывод, memory-mapped I/O
- [ ] `13_MultiIssue/lecture.md` — множественный запуск, OoO
- [ ] `14_TLP/lecture.md` — параллелизм на уровне потоков
- [ ] `15_Optimize/lecture.md` — оптимизации
- [ ] `15_Optimize/toolchain.md` — toolchain
- [ ] `16_DLP/lecture.md` — параллелизм на уровне данных, SIMD
- [ ] `16_TPU/lecture.md` — Tensor Processing Unit (доп. глава)

### 4.2. Домашние задания и контрольные

- [ ] `Tasks/homeworks.md` — список домашек
- [ ] `final_tests.md` — индекс контрольных
- [ ] `final_test.md`, `final_test2.md`, `final_test_2022.md` (архив)
- [ ] `final_test_dsba_2023.md` ... `final_test_dsba_2026.md` (по необходимости — это варианты для конкретных потоков, можно отложить или не переводить)
- [ ] `final_test_compds_2023.md` ... `final_test_compds_2026.md` (аналогично)
- [ ] `final_test_answers_2026.md` (опционально, скорее всего не публичный)

### 4.3. Архивные/групповые страницы (низкий приоритет, можно пропустить)

- [ ] `2023_group211.md`, `2023_group212.md`, `2023_group213.md`, `2023_group214.md`
- [ ] `group200.md`, `group200_retake.md`, `group201.md`, `group202.md`, `group203.md`, `group204.md`

---

## 5. Лекции по операционным системам (`docs/part2os/`) — модуль 4

### 5.1. Лекции и материалы к workshop'ам

- [ ] `01_OS_Architecture/lecture.md` — архитектура ОС, Linux
- [ ] `01_OS_Architecture/kernel/lecture.md` — лекция по ядру
- [ ] `02_C/lecture.md` — язык C
- [ ] `02_C/debugger.md` — отладчик
- [ ] `03_SystemCalls/lecture.md` — системные вызовы
- [ ] `04_Linking/lecture.md` — формат исполняемого файла, компоновка
- [ ] `04_Linking/libs.md` — библиотеки
- [ ] `04_Linking/make.md` — make
- [ ] `05_Strings/lecture.md` — динамическая память и строки
- [ ] `05_Strings/strings/c_strings.md`
- [ ] `05_Strings/strings/patterns.md`
- [ ] `05_Strings/strings/regexes.md`
- [ ] `05_Strings/strings/regexes_ex.md`
- [ ] `05_Strings/strings/workshop.md`
- [ ] `06_Processes/lecture.md` — процессы и потоки
- [ ] `06_Processes/bash.md`
- [ ] `07_Synch/lecture.md` — ввод-вывод и файлы
- [ ] `08_IPC/lecture.md` — синхронизация
- [ ] `09_IPC/lecture.md` — IPC
- [ ] `09_IPC/workshop_messages.md`
- [ ] `10_Permissions/lecture.md` — пользователи, группы, права
- [ ] `11_VM/lecture.md` — виртуальные машины
- [ ] `11_VM/java.md`, `11_VM/llvm.md`, `11_VM/python.md`
- [ ] `12_Networking/lecture.md` — сетевое взаимодействие
- [ ] `12_Networking/workshop1.md`, `12_Networking/workshop2.md`
- [ ] `13_Sockets/lecture.md` — сокеты
- [ ] `14_Python/lecture.md` — высокоуровневые языки и ОС
- [ ] `14_Python/python.md`
- [ ] `15_Clang/lecture.md` — Clang/LLVM (доп. глава)
- [ ] `linux.md` — общий очерк по Linux

### 5.2. Задания

- [ ] `Tasks/01_fork_string.md`
- [ ] `Tasks/02_walk_parse.md`
- [ ] `Tasks/03_regex_messages.md`
- [ ] `Tasks/04_shared_memory_regex.md`
- [ ] `Tasks/05_signals_binary.md`
- [ ] `Tasks/06_signals_fork.md`
- [ ] `Tasks/07_walk_file.md`
- [ ] `Tasks/test.md`

### 5.3. Контрольные работы

- [ ] `final_tests.md`, `final_test.md`, `final_test2.md`, `final_test_2022.md`
- [ ] `os_final_test_dsba_2023.md` ... `os_final_test_dsba_2025.md`
- [ ] `os_final_test_compds_2023.md` ... `os_final_test_compds_2025.md`

### 5.4. Варианты заданий (низкий приоритет — потоковые материалы)

- [ ] `variants_compds_2023.md`, `variants_compds_2023_2.md`
- [ ] `variants_dsba_2023_g211.md` ... `variants_dsba_2023_g214.md`
- [ ] `variants_dsba_2024_g221.md` ... `variants_dsba_2024_g224.md`
- [ ] `variants_dsba_2025_g231.md` ... `variants_dsba_2025_g234.md`
- [ ] `variants_2024_compds1.md`, `variants_2024_compds2.md`
- [ ] `variants_2024_ead1.md`, `variants_2024_ead2.md`, `variants_2024_ead3.md`
- [ ] `variants_2024_vsn.md`
- [ ] `variants_2025_compds231.md`, `variants_2025_compds232.md`
- [ ] `variants_2025_ead231.md`, `variants_2025_ead232.md`, `variants_2025_ead233.md`
- [ ] `variants_2025_vsn231.md`

### 5.5. Архивные/групповые страницы

- [ ] `group201.md`, `group202.md`, `group203.md`, `group204.md`

---

## 6. Контент в коде и слайдах

- [ ] Решить, что делать со слайдами (`*.pdf`, `*.pptx`) — у курса много отдельных файлов слайдов в `docs/part1ca/*/CA_Lecture_*.pdf`. Перевод требует пересборки в LaTeX/PowerPoint. Можно:
  - [ ] оставить англоязычные слайды (минимум усилий, типичный подход)
  - [ ] добавить русские versions с суффиксом `_ru`
- [ ] Перевести комментарии в примерах кода (`*.asm`, `*.c`) — только комментарии, не сам код
- [ ] Картинки с английским текстом (`docs/images/*.png`) — пересоздать или оставить
- [ ] Внешние ссылки — где есть русский эквивалент (Wikipedia, документация), давать русскую версию

---

## 7. QA и финальная проверка

- [ ] Орфография/пунктуация (LanguageTool, ёфикатор, ручная вычитка)
- [ ] Техническая точность — review преподавателем курса
- [ ] Согласованность терминологии: пройтись скриптом по `GLOSSARY.md` и убедиться что переводы единообразны
- [ ] Проверить все внутренние ссылки в русских файлах ведут на русские страницы (а не на английские)
- [ ] MathJax-формулы — убедиться что не сломались (символы доллара, спец-символы)
- [ ] Сверка со страницами английской версии: TOC, заголовки, нумерация секций
- [ ] Тест переключателя: `EN ↔ RU` сохраняет позицию в иерархии страниц (с лекции CA №7 EN на лекцию CA №7 RU)
- [ ] Проверить рендер на всех типах страниц (lecture, dense-data, books, resource-index)
- [ ] Прогнать сайт в обоих темах (light/dark) — убедиться что русские длинные слова не ломают вёрстку (особенно в шапке/нав-меню)
- [ ] Lighthouse / accessibility прогон на русских страницах

---

## 8. Поддержка и синхронизация

- [ ] Завести в `CONTRIBUTING.md` раздел «Как обновлять перевод при изменениях upstream»
- [ ] Скрипт-помощник: показывает, какие EN-файлы менялись после последней правки соответствующего RU-файла (по `git log`)
- [ ] Автоматизировать sync с upstream `andrewt0301/master` через GitHub Action
- [ ] Завести issue-шаблон «Translation: <страница>» для распределения работы между контрибьюторами
- [ ] Договориться, кто merge'ит русские правки и в каком темпе

---

## Грубая оценка объёма

| Этап | Файлов | Приоритет | Оценка |
|---|---|---|---|
| 0. Подготовка + глоссарий | — | критично | 1 день |
| 1. Инфраструктура и UI-строки | — | критично | 1–2 дня |
| 2. Корневые страницы | 14 | высокий | 2–3 дня |
| 3. Software setup | 12 | высокий | 1–2 дня |
| 4. CA лекции (16) + домашки + контрольные | ~30 (без архивов) | высокий | 2–3 недели |
| 5. OS лекции + workshops + tasks | ~35 (без вариантов) | высокий | 2–3 недели |
| 4.3 / 5.4 / 5.5. Варианты, группы | ~50 | низкий | по необходимости |
| 6. Слайды/код/картинки | — | низкий | по решению |
| 7. QA | весь корпус | критично | 1 неделя |
| 8. Поддержка | — | постоянно | — |

Реалистичный полный цикл (без потоковых вариантов): **6–8 недель** одного исполнителя
с консультациями преподавателя курса. С разделением между контрибьюторами — короче.

---

## Что сделать прямо сейчас (короткий первый спринт)

Минимальный «жизнеспособный» русский режим, чтобы переключатель действительно работал:

- [ ] Принять решение по структуре файлов (раздел 0, пункт 1)
- [ ] Согласовать первые ~20 терминов из глоссария (раздел 0.1)
- [ ] Перевести UI-строки в шапке/футере (раздел 1.1)
- [ ] Сделать переключатель EN/RU функциональным (раздел 1) с fallback на английский
- [ ] Перевести `docs/index.md` (главная)
- [ ] Перевести `docs/grades.md` и `docs/exam_latest.md` (это ищут чаще всего)
- [ ] Убрать/обновить плашку «Русская версия пока в разработке»

После этого можно развернуть «частично русский» сайт и параллельно
переводить лекции по приоритету курса.
