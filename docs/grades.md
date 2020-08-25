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

# Grading System

__TODO: UNDER DEVELOPMENT, TO BE UPDATED__
 
__The present text is copied from [here](https://uneex.ru/HSE/RatingFormula).__

### Rating formula

Shortly speaking:
 * It is recommended to equally maximize each module score.
 * Bonuses are separated by module and costs +20% total.
 * Visit classes.
 * Do not cheat (it costs).

#### Overall formula

We'll have 2 modules, each scored $$M_i$$ in the same way, and final exam $$E$$.

$$G = 10*min(1, \frac{\sum_{i=1}^2M_i+E}{3})$$

#### Details

Each module score calculates from Regular and Bonus points:

$$M_i = \frac{45}{100}H + \frac{10}{100}T + \frac{10}{100}P + \frac{35}{100}F$$

#### Score points (100%)

|| Variable || Score ||  Description ||
|| H || 45% || EJudge / other practical homework. You must solve tasks in time, 50% penalty for a week outdated task, 75% penalty otherwise, no score for unsolved one. Also no score for copy-paste / rewrite or other cheating (either source or destination), this can be enquired ||
|| T || 10% || Offline tests. Main use is self-checking, but here's 10% ||
|| P || 10% || Class presence. You need to attend more than 3/4 of total classes to earn this point ||
|| F || 35% || Final online test. You can skip this on with 60% penalty; 100% penalty for cheating (both sides; can be enquired) ||
|| A,,k,, || 5% each || Class activity. Each time you broadcast a solution of a task during class hours, you get this point ||
