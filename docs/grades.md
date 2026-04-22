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

## Final Grade

There are two [modules](#modules) $$M_3$$/$$M_4$$ (scored in the same way) and final [exam](#exam) $$E$$, which have an equal weight.

$$G = \frac{M_3 + M_4 + E}{3}$$

If the final grade $$G$$ is unsatisfactory, the exam can be [retaken](#retake-policy).

#### Automatic Grades

Students, who have __attended > 75%__ of classes in each of the two [modules](#modules),
can get an automatic grade. The formula is the following:

$$G = \frac{M_3 + M_4}{2} - 1$$

Rounding of grades is regulated by the [rounding](#rounding) policy.

Cheating in any assessment element is a subject to [cheating](#cheating-policy) policy.

## Modules

Each module score is calculated from [regular](#regular-points-10-points) $$R$$ and [bonus](#bonus-points-2-points) $$B$$ points:

$$M_i = min(10, R_i + B_i)$$

#### Regular Points: 10 points

$$R_i = 0.45\cdot H + 0.45\cdot F + 0.1\cdot A$$

| Variable | Score | Description |
| $$H$$    | 45%   | Homeworks. There are deadlines. Delays cause penalties: 25% for each week of delay. Maximal penalty is 75%. |
| $$F$$    | 45%   | Final test (midterm). |
| $$A$$    | 10%   | Workshop attendance. You need to attend > 75% of classes to earn this point. |

#### Bonus Points: 2 points

$$B_i = 2\cdot \frac{C_1 + C_2 + \ldots + C_{k-1} + C_k}{k}$$

| Variable | Score   | Description |
| $$C_k$$  | $$1$$   | Class activity. Each time you broadcast a solution of a task during a workshop, you get this point. |
| $$k$$    | n/a     | Number of classes. |

## Exam

The description of the exam format and its grading policy is [here](exam_latest.md).

## Retake Policy

On the first and second retakes, the cumulative course grade is taken into consideration. In case of receiving an unsatisfactory final grade after the first retake, the student may refuse to participate in the second retake and instead repeat the course according to the individual curriculum. The cumulative grade is formed again as a result of repeated courses. After completing the repeated course, the student is given a second retake only, which the student previously refused. 

## Rounding

All intermediate grades (including module and exam grades) are rounded to hundredths (the precision is 0.01).

The final grade is calculated with precision 0.01 and then rounded to the nearest integer.

## Cheating Policy

If plagiarism is detected (including material generated with the help of generative AI without prior approval from the teacher), the assessment element will be assigned a score of "0".

If there is a suspicion that the task was not completed independently, the teacher has the right to initiate an additional verification or a defense of this particular assessment element. The final grade for the element will be based on the results of such verification or defense.

The teacher also has the right to randomly invite any student to defend any assessment element, regardless of plagiarism or suspicion. If the student refuses or fails to defend the work, the grade for this element will be annulled and recorded as "0".
