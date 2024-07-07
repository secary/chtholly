# Reminder for mid-trimester test
## 2024 Trimester 2

### Set's notation and limit
* If $g(x)$'s domain is $[0,x]$, $h(x)=g(\frac{x}{3})$'s domain is $[0,3x]$
*  Multipule sum:
$$ 
\sum_{i=1}^{m} \sum_{j=1}^{n} i = \sum_{i=1}^{m} n \cdot j \cdot i = n \cdot j \cdot (1 + 2 + \cdot\cdot\cdot + m)
$$
* Convergent = 收敛 Divergent = 发散

### Combination and permutation
* If you want to choose 7 pieces of fruit from 5 kinds of fruit, you should use stars and bars to calculate the combination: $$\binom{7+5-1}{7}=330 \\ |*|*|*|**|*| \\ *:7 \\|:4$$  
the $7+5-1$ means there are 7 of your choice 5 of the kinds, so you would need to divide the whole stars into 12 sections which means you just need $7+5-1$ bars(the outside bars are not included). And 7 means you need to choose 7 pieces at last, which is 7 stars. You should calculate the combination of choose the stars among the stars and bars.


### Probability
* Bayes theory`(Given B to calculate A's probability)`:
$$
P(A|B) = \frac{P(B|A)P(A)}{P(B)}
$$
* Total probability :
$$
P(A) = \sum_{n}P(A|B_n)P(B_n)
$$
* Expectation:
$$
E(aX + bY) = aE(x) + bE(Y)
$$
* Variance:
$$
\begin{aligned}
Var(X) &=  E[(X - E[X])^2]\\
&=E[X^2 - 2XE[X] + E[X]^2]\\
&=E[X^2] - 2E[X]E[X] + E[X]^2\\
&=E[X^2] - E[X]^2\\
\end{aligned}
$$

### Matrix
* The product of matrices:
$$
\begin{aligned}
\begin{bmatrix}
a & b \\
c & d \\
e & f
\end{bmatrix}
\cdot
\begin{bmatrix}
g & h & i\\
j & k & l
\end{bmatrix}
&=
\begin{bmatrix}
ag+bj & ah+bk & ai+bl\\
cg+dj & ch+dk & ci+dl\\
eg+fj & eh+fk & ei+fl
\end{bmatrix}
\end{aligned}
$$
* Design matrix for linear regression:  
Consider there is 3 linear points $(x_1,y_1),(x_2,y_2),(x_3,y_3)$

The design matrix would be like:
$$
\begin{bmatrix}
1 & x_1\\
1 & x_2\\
1 & x_3
\end{bmatrix}
$$
* The determinant of  matrix:  
Consider there is a matrix $A$ as below,
$$
\begin{bmatrix}
a & b & c\\
d & e & f\\
g & h & i
\end{bmatrix}\\
det(A) = aei + bfg + cdh - ceg - bdi - afh
$$