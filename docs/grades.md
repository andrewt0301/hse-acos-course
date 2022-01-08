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
 
<!--- The present text is based on https://uneex.ru/HSE/RatingFormula -->

# Grading System

## General Advice

 * Maximize score for each of the modules.
 * Note that bonuses are separated by module.
 * Attend classes.
 * Do not cheat, it costs.

## Overall Formula

There are __2 modules__ $$M_i$$ (scored in the same way) and final __exam__ $$E$$,
which have an equal weight.

$$G = \frac{\sum_{i=1}^2M_i+E}{3}$$

If the final grade $$G$$ is unsatisfactory, the exam can be retaken.
In situations when it does not help because of low module grades $$M_i$$,
the decision about the final grade is done by the commission of faculty members,
who will hold the final exam.   

## Module Formula

Each module score is calculated from Regular and Bonus points:

$$M_i = min(10, R_i + B_i)$$

#### Regular Points: 10 points

$$R_i = \frac{45}{100}\cdot H + \frac{10}{100}\cdot Q + \frac{10}{100}\cdot P + \frac{35}{100}\cdot F$$

| Variable | Score | Description |
| $$H$$    | 45%   | Homework (practical tasks). There are deadlines. Delays cause penalties: 25% for each week of delay. 100% penalty for cheating. |
| $$Q$$    | 10%   | Quizzes for self-checking. |
| $$P$$    | 10%   | Class presence. You need to attend more than 3/4 of classes to earn this point. |
| $$F$$    | 35%   | Final test (programming assignment). 100% penalty for cheating. |

##### Homework Defences

Homeworks are submitted in a written form.
However, to control understanding of the material and to prevent cheating, homeworks are to be defended.
During the defence, a student is asked questions on the topic of the homework.
The final grade for a homework is decided at the defence.
Defences do not have deadlines. However, it is illegal to have more than 5 undefended homeworks.
When the number of undefended homeworks is larger than 5,
the earliest homeworks that  exceed the limit are rejected with 0 score. 

#### Bonus Points: 2 points

$$B_i = 2\cdot \frac{\sum_k A_k}{100}$$

| Variable | Score   | Description |
| $$A_k$$  | 5% each | Class activity. Each time you broadcast a solution of a task during class hours, you get this point. |

## Exam Format

The description of the exam format and exam grading rules is [here](exam.md).
