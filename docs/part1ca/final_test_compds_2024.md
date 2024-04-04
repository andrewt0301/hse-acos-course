# Контрольная Работа: Архитектура Компьютера

Формула оценки:

__Grade = 0.4 * Теория + 0.6 * Задача__

## Часть 1: Теория

Отправляйте свои ответы через эту [форму]().

Можно отвечать и по-русски и по-английски.
Ответ на каждый из вопросов - примерно 1-2 предложения (основные факты, без "воды").
Формулируйте ответы __своими словами__.
Оценивается ваше понимание темы и знание основных фактов.
Ответы, скопированные из внешних источников и у других студентов,
не принимаются. В случае выявления плагиата - штраф 100%.

Критерии оценивания:

* Ответы на вопросы по каждой из тем (data formats, pipeline, caches)
  имеют одинаковый вес и дают до 33.3% от балла за теорию.
* Ответы на вопросы в рамках одной темы оцениваюся, как единое целое.
  Они пронумерованы, чтобы никто ничего не пропустил.
  Как правило, основные вопросы идут первыми в списке.

Вопросы:

* __Integer and floating-point formats__.
  1. Describe how integers are represented in the binary format (unsigned integers, 2's complement).
  2. What is the difference between integer sign- and zero-extension?
  3. What is the difference between arithmetical and logical shift?
  4. What is integer overflow?
  5. Explain the floating-point format (sign, exponent, fraction). Describe single and double precision.
  6. What is implicit `1.` in fraction?
  7. Why exponents are biased and what is bias?
  8. What are floating-point overflow and underflow?

* __Pipeline__.
  1. Describe the concept of pipeline.
  2. List the 5 stages and give brief descriptions for them.
  3. What pipeline hazards are?
  4. List the types of hazards and the ways to prevent them (with brief definitions).
  5. Give an example of a hazard situation and how it can be handled.
  6. What is branch prediction is needed for?
  7. How the loop unrolling optimization can help improve pipeline performance?

* __Caches__.
  1. Give a brief definition of a cache. Why do we need it?
  2. Explain how caching works (block, index, tag, valid bit, dirty bit).
  3. Give the definition of associativity (direct-mapped, set associative, fully associative).
  4. What is the difference between write-through and write-back?
  5. What is replacement policy (what types of policy do you know)?
  6. How many cache levels are typical for modern processors?
  7. What problem can caches create for multicore processors?

## Часть 2: Задача по программированию

Написать на ассемлере RISC-V программу, которая реализует функцию `f(x)`
согласно заданной формуле.
У каждого студента свой индивидуальный вариант формулы.
Задание разбито на 7 задач (шагов).
Это сделано для того, чтобы можно было оценить неполные решения.

Критерии оценивания:

1. Полное решение задач 1-4 дает по 1 баллу за каждую задачу.
2. Полное решение задач 5-7 дает по 2 балла за каждую задачу.
3. Полное решение всех задач дает в сумме 10 баллов.

Ejudge контесты по группам:

* [КНАД1](http://84.201.145.249/cgi-bin/new-client?contest_id=254)
* [КНАД2](http://84.201.145.249/cgi-bin/new-client?contest_id=255)
* [ЭаД1](http://84.201.145.249/cgi-bin/new-client?contest_id=256)
* [ЭаД2](http://84.201.145.249/cgi-bin/new-client?contest_id=257)
* [ЭаД3](http://84.201.145.249/cgi-bin/new-client?contest_id=258)
* [ВСН](http://84.201.145.249/cgi-bin/new-client?contest_id=259)
