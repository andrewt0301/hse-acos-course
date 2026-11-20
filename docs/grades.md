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

Grading System
---

## Formula

Final grade _G_ is calcutated using the following formula:

$$G = 0.4\cdot E + 0.2\cdot H + 0.2\cdot * W + 0.2\cdot * L 

| Variable | Description |
| $$E$$    | [Exam](#exam). |
| $$H$$    | Homeworks. There are deadlines. Delays cause penalties: 25% for each week of delay. Maximal penalty is 75%. |
| $$W$$    | Workshops. Solving tasks in a class. |
| $$L$$    | Lectures. Solving quizzes and contests in a class. |

The pass grade is 4, which means that all grades below 4 (including 3.99) are regarded as unsatisfactory.

Rounding of grades is regulated by the [rounding](#rounding) policy.

If final grade _G_ is unsatisfactory, the exam can be [retaken](#retake-policy).

Cheating in any assessment element is a subject to [cheating](#cheating-policy) policy.

#### Bonus Points: 2 points

Bonus $$B$$ is calculated as a workshop activity rate and can give up to 2 points (for 100% rate):

$$B = 2\cdot \frac{C_1 + C_2 + \ldots + C_{k-1} + C_k}{k}$$

| Variable | Score   | Description |
| $$C_k$$  | $$1$$   | Class activity. Each time you broadcast a solution of a task during a workshop, you get this point. Also, this point can be earned by solving bonus homework tasks (each has its own score). |
| $$k$$    | n/a     | Number of classes. |

## Exam

The description of the exam format and its grading policy is [here](exam_latest.md).

## Retake Policy

On the first and second retakes, the cumulative course grade is taken into consideration. In case of receiving an unsatisfactory final grade after the first retake, the student may refuse to participate in the second retake and instead repeat the course according to the individual curriculum. The cumulative grade is formed again as a result of repeated courses. After completing the repeated course, the student is given a second retake only, which the student previously refused. 

## Rounding

All intermediate grades are rounded to hundredths (the precision is 0.01).

The final grade is calculated with precision 0.01 and then converted into an integer:
* Grades >= 4.00 are rounded (i.e. 4.49 becomes 4 while 4.50 becomes 5).
* Grades < 4.00 are truncated (i.e. 3.99 becomes 3).

## Cheating Policy

If plagiarism is detected (including material generated with the help of generative AI without prior approval from the teacher), the assessment element will be assigned a score of "0".

If there is a suspicion that the task was not completed independently, the teacher has the right to initiate an additional verification or a defense of this particular assessment element. The final grade for the element will be based on the results of such verification or defense.

The teacher also has the right to randomly invite any student to defend any assessment element, regardless of plagiarism or suspicion. If the student refuses or fails to defend the work, the grade for this element will be annulled and recorded as "0".
