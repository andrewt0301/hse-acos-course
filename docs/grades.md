<!---
The JavaScript code below is needed to suppport rendering of TeX formulas in GitHub Pages.

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

#### General Advice

 * Maximize score for each of the modules.
 * Note that bonuses are separated by module.
 * Visit classes.
 * Do not cheat, it costs.

#### Overall Formula

There are 2 modules, each scored $$M_i$$ in the same manner, and final exam $$E$$.

$$G = \frac{\sum_{i=1}^2M_i+E}{3}$$

#### Module Formula

Each module score is calculated from Regular and Bonus points:

$$M_i = min(10, R_i + B_i)$$

#### Regular Points: 10 points

$$R_i = 10\cdot (\frac{45}{100}\cdot H + \frac{10}{100}\cdot Q + \frac{10}{100}\cdot P + \frac{35}{100}\cdot F)$$

| Variable | Score | Description |
| $$H$$    | 45%   | Homework (practical tasks). There are deadlines. 50% penalty for being 1 week late. 75% penalty for larger delays. 100% penalty for cheating. |
| $$Q$$    | 10%   | Quizzes for self-checking. |
| $$P$$    | 10%   | Class presence. You need to attend more than 3/4 of classes to earn this point. |
| $$F$$    | 35%   | Final test (programming assignment). 100% penalty for cheating. |

#### Bonus Points: 2 points

$$B_i = 2\cdot \frac{\sum_k A_k}{100}$$

| Variable | Score   | Description |
| $$A_k$$  | 5% each | Class activity. Each time you broadcast a solution of a task during class hours, you get this point. |
