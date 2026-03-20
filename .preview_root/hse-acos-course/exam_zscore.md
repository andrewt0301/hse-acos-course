```javascript
/** @OnlyCurrentDoc */
/** @OnlyCurrentDoc */
function Zscore(log, mlen=3) {
  let res = 0;
  let len = 0;
  for(const c of log) {
    len+=1;
    switch(c) {
      case ' ': len -= 1; break;
      case '+': res += 2; break;
      case '-':
      case '0': break;
      case '±':
      case '/': res += 1; break;
    }
  }
  return Math.ceil(res*3./Math.max(len, mlen));
}
```
