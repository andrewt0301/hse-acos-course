# Grading System

__TODO: UNDER DEVELOPMENT, TO BE UPDATED__
 
__The present text is copied from [here](https://uneex.ru/HSE/RatingFormula).__


<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [['$','$'], ['\\(','\\)']],
      processEscapes: true
    }
  });
</script>

Notes about $ \sum_{Thing} $

\\[ \frac{1}{n^{2}} \\]

<!---
See this for kramdown:
https://mikelove.wordpress.com/2015/07/01/how-to-use-latex-math-in-rmd-to-display-properly-on-github-pages/
https://varunagrawal.github.io/2018/03/27/latex
https://stackoverflow.com/questions/26275645/how-to-support-latex-in-github-pages
-->

### Rating formula

Shortly speaking:
 * It's recommended to equally maximize each module score
 * You can skip any final test and get +14% for free, but if you join it, you can get anything from +0% to +35%
 * Bonuses are separated by module and costs +20% total
 * Visit classes ☺
 * Do not cheat, please, it costs!

#### Overall formula

We'll have 3 modules, each scored $$M_i$$ in the same way, and final exam $$E$$.

$$G = 10*min(1,\ frac{sum_{i=1}^3M_i+E}{4})$$

== Details ==
Each module score calculates from Regular and Bonus points:

$$M_i = min(1,\ R_i+2/10B_i,)$$

#### Regular points (100%)

|| Variable || Score ||  Description ||
|| H || 45% || EJudge / other practical homework. You must solve tasks in time, 50% penalty for a week outdated task, 75% penalty otherwise, no score for unsolved one. Also no score for copy-paste / rewrite or other cheating (either source or destination), this can be enquired ||
|| T || 10% || Offline tests. Main use is self-checking, but here's 10% ||
|| P || 10% || Class presence. You need to attend more than 3/4 of total classes to earn this point ||
|| F || 35% || Final online test. You can skip this on with 60% penalty; 100% penalty for cheating (both sides; can be enquired) ||

$$R_i = frac{45}{100}H + 10/100T + 10/100P + 35/100F$$

#### Bonus points (+20% max)

Any ''200%''-task can be shared (in fact, sharing is suggested), in that case it'll be divided by the number of administrants (thus ''200%'' score)

|| Variable || Score || Description ||
|| L ||  ''200%'' || Lecture conspectus. Can be in Russian. Must cover ''all'' lectures to be scored. Each conspectus shall include a paragraph on each topic mentioned in lecture syllabus, and must be approved by lecturer and published here ||
|| S || ''200%'' || Video subtitles (in English). Must cover ''all'' lectures to be scored, be verified by lecturer and published on !YouTube ||
|| C,,k,, || 10% each|| Single class conspectus. Can be in Russian. Shall include all themes from the class, practice statements and it's solutions and must be approved by lecturer. No copy-paste is allowed, and no scoring if more than a week late. ||
|| A,,k,, || 5% each || Class activity. Each time you broadcast a solution of a task during class hours, you get this point ||

 * $$L_{yours} = frac{2}{team\ size}$$ if L is complete and checked
 * $$S_{yours} = frac{2}{team\ size}$$ if S is complete and checked
 * $$B_i = min(1\, max(L_{yours},\ S_{yours},\ 1/10\sum_k C_k + 1/20\sum_k A_k ))$$
