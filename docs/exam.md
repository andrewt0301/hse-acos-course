<!---
The JavaScript code below is needed to support rendering of TeX formulas in GitHub Pages.

See this for kramdown:
https://mikelove.wordpress.com/2015/07/01/how-to-use-latex-math-in-rmd-to-display-properly-on-github-pages/
https://varunagrawal.github.io/2018/03/27/latex
https://stackoverflow.com/questions/26275645/how-to-support-latex-in-github-pages

This is a guideline to render formulas:
https://coderoad.ru/49970549/Проблема-рендеринга-некоторого-синтаксиса-latex-в-MathJax-с-Jekyll-на-github
-->
<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [['$$','$$'], ['\\(','\\)']],
      processEscapes: true
    }
  });
</script>

Exam Format
---

## Exam

The exam is organized as a discussion between the examiner and a group of 5-7 students,
which covers all main topics of the course and takes about 2 hours.
During the discussion, the examiner asks questions related to the course topics and
the students answer to these questions in an arbitrary order.
The examiner writes down an exam protocol in a simple form («student, topic, point (+/-/±)»).
For each of the questions, students can earn the following points:

* __«+»__: Complete enough answer in any form (including «I don't know, but think that…»,
adequate retelling of documentation, etc.).

* __«±»__: Significantly incomplete answer, answer that contains both correct and incorrect
statements, a correct answer the student cannot correctly explain (for example, a random answer).

* __«-»__: Totally incorrect answer, answer irrelevant to the question, general discussion
demonstrating absence of understanding of the topic, reading aloud texts without
their understanding, retelling answers of other students.

* __Collective «0»__: Absence of an answer to a simple question (from a point of the examiner).
This slightly decreases the grade of every student in the group.

It is allowed to use any materials during the exam. However, it is illegal to answer questions
by simply reading from these materials. Also, it is forbidden to retell answers of other students.

## Grading Policy
 
For each student, the assessment is done by the following criteria:

* Ratio of the number of correct answers to the number of incorrect answers.
* Degree of coverage of course topics with answers.
* Any additional knowledge related to the course topics.

### Formula

The overall formula for the exam grade:

$$G = 10\cdot \frac{P_1 + P_2}{12}$$ 

The exam consists of __2 parts__ $$P_1$$ and $$P_2$$ each containing questions
that cover topics from module 3 and module 4 respectively.
To get a maximal grade, a student needs to successfully answer __3 questions__ from each part.
Each answer can give __0 to 2 relative points__ (0 for «-», 1 for «±», and 2 for «+»), which
are then divided by __maximal point 12__ to give a grade. 

Points for each part $$P_i$$ are calculated with the [Zscore](exam_zscore.md) function,
which counts points for each of the questions and divides them by the total number of answers
given by a student.

Examples of calculated grades:

| __Student__ | __Answers in $$P_1$$__ | __Answers in $$P_2$$__ | __$$G$$__ |
| Student 1	  | +++                    | +++                    | 10        |
| Student 2	  | ++                     | ++	                    | 6.67      |
| Student 3	  | ++/ 	               | ++/                    | 8.33      |
| Student 4	  | ///                    | ///                    | 5         |
| Student 5	  | ++-+                   | +++                    | 9.17      |

### Notes

* In a group of students, there are always some shy people who try to avoid participating in
  the discussion. Typically, they sit in the back row. The examiner must control this
  and ask some questions to these people personally (not to the entire group).

* Nevertheless, people who choose to keep silence during the exam are their own enemies.

* A good strategy for taking the exam is to distribute questions in advance so that
  there is always somebody to answer hard questions while easy questions are left
  to less confident people. 

## Topics

Topics __are not__ questions. They are areas, from which questions are selected.
Usually questions are of the following types:

* What it is?
* How does it work?
* What is it for?
* Why cannot we use [_something else_]?
* Why [_correct statement_] and not [_less correct statement_]?
* What is the difference between [_read documentation in one place_] and
  [_read documentation in another place_]?
* etc.

When answering questions it is __allowed__ to use documentation. Moreover, in some situations,
it is __necessary__. However, there are several important notes:

* Ability to quickly find an answer in documentation is a __skill__ and the exam assesses
  this skill among other things.

* Information from external sources is accepted only as a __retelling__ or must be provided with
  __explanations__. Reading information does not give any points.

* If you do not really understand what your are talking about, reading aloud an unfamiliar
  text will clearly demonstrate this __absence of understanding__.

Topics are grouped by modules to simplify exam preparation.

## Topic Examples

Examples of exam topics for year 2019/2020 can be found [here](exam_2019.md).
