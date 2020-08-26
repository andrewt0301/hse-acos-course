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

__TODO: UNDER DEVELOPMENT, TO BE UPDATED__
 
<!--- The present text is copied from https://uneex.ru/HSE/RatingFormula -->

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

$$R_i = 10\cdot (\frac{45}{100}\cdot H + \frac{10}{100}\cdot T + \frac{10}{100}\cdot P + \frac{35}{100}\cdot F)$$

| Variable | Score | Description |
| $$H$$    | 45%   | EJudge / other practical homework. You must solve tasks in time, 50% penalty for a week outdated task, 75% penalty otherwise, no score for unsolved one. Also no score for copy-paste / rewrite or other cheating (either source or destination), this can be enquired. |
| $$T$$    | 10%   | Offline tests. Main use is self-checking, but here's 10%. |
| $$P$$    | 10%   | Class presence. You need to attend more than 3/4 of total classes to earn this point. |
| $$F$$    | 35%   | Final online test. You can skip this on with 60% penalty; 100% penalty for cheating (both sides; can be enquired). |

#### Bonus Points: 2 points

$$B_i = 1/20\sum_k A_k$$

| Variable | Score   | Description |
| $$A_k$$  | 5% each | Class activity. Each time you broadcast a solution of a task during class hours, you get this point. |
