# Контрольная Работа: Архитектура Компьютера

Формула оценки:

__Grade = 0.4 * Теория + 0.6 * Задача__

## Часть 1: Теория

Отправляйте свои ответы через эту [форму](https://forms.gle/FebnPgadueCnWFwYA).

_Пишите ответы в текстовом редакторе, сохраняйте у себя локально, и только потом отправляйте.
Если по какой-о причине не удалось отправить (форма не сработала), отправляйте ответы преподавателю._

Можно отвечать и по-русски и по-английски.
Ответ на каждый из вопросов - примерно 1-2 предложения (основные факты, без "воды").
Формулируйте ответы __своими словами__.
Оценивается ваше понимание темы и знание основных фактов.
Ответы, скопированные из внешних источников и у других студентов,
не принимаются. В случае выявления плагиата - штраф 100%.

Критерии оценивания:

* Ответы на вопросы по каждой из тем (data formats, CPU, memory)
  имеют одинаковый вес и дают до 33.3% от балла за теорию.
* Ответы на вопросы в рамках одной темы оцениваются, как единое целое.
  Они пронумерованы, чтобы никто ничего не пропустил.
  Как правило, основные вопросы идут первыми в списке.

Вопросы:

* __Data formats__.
  1. Describe how integers are represented in the binary format (unsigned integers, 2's complement).
  2. What is the difference between integer sign- and zero-extension?
  3. What is the difference between arithmetical and logical shift?
  4. What is integer overflow?
  5. Explain the floating-point format (sign, exponent, fraction). Describe single and double precision.
  6. What is implicit `1.` in fraction?
  7. Why exponents are biased and what is bias?
  8. What are floating-point overflow and underflow?

* __CPU__.
  1. Describe the concept of pipeline. List the 5 pipeline stages with brief descriptions.
  2. What pipeline hazards are? List hazards and ways to prevent them.
  3. Give an example of a hazard situation and how it can be handled. 
  4. Explain what branch prediction is needed for.
  5. Explain the idea of multiple-issue (superscalar) processor and out-of-order execution.
  6. List the types of thread-level parallelism with brief explanation.
  7. How the loop unrolling optimization can help improve performance?
  8. What CPU does your laptop/desktop have (model name)? How many cores does it have?

* __Memory__.
  1. Describe the idea of memory hierarchy. Why do we need it?
  2. Explain what a cache is and how it works (block, index, tag, valid bit, dirty bit).
  3. Give the definition of associativity (direct-mapped, set associative, fully associative).
  4. What is the difference between write-through and write-back?
  5. What is replacement policy (what types of policy do you know)?
  6. Explain how CPU translates virtual addresses into physical.
  7. What is a TLB miss and what is a page fault?
  8. How many caches does your laptop/desktop have?

## Часть 2: Задача по программированию

Написать на ассемблере RISC-V программу, которая реализует функцию `f(x)`
согласно заданной формуле. У каждого студента свой индивидуальный вариант формулы.
Задание разбито на 7 задач (шагов). Это сделано для того, чтобы можно было оценить неполные решения.

Критерии оценивания:

1. Полное решение задач 1-4 дает по 1 баллу за каждую задачу.
2. Полное решение задач 5-7 дает по 2 балла за каждую задачу.
3. Полное решение всех задач дает в сумме 10 баллов.

Замечания:
1. Не используйте Web Proxy.
2. Заходить в контест своей группы (по номеру группы в логине, даже если сменили группу).

Ejudge контесты по группам:
* [ЭАД 231](http://158.160.144.239/cgi-bin/new-client?contest_id=276)
* [ЭАД 232](http://158.160.144.239/cgi-bin/new-client?contest_id=277)
* [ЭАД 233](http://158.160.144.239/cgi-bin/new-client?contest_id=278)
* [КНАД 231](http://158.160.144.239/cgi-bin/new-client?contest_id=279)
* [КНАД 232](http://158.160.144.239/cgi-bin/new-client?contest_id=280)
* [ВСН 231/232](http://158.160.144.239/cgi-bin/new-client?contest_id=281)
