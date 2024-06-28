# MATHS 7027 Mathematical Foundations of Data Science
### Trimester2, 2024
### Dongju Ma

## Assignment 3 - Question 1
## 1(a)
The $\lambda$ of $X \sim Pois(\lambda)$ is 5, which is the mathematical expectation of how many tickets are received per hour.

## 1(b)
The probability asked is $P(3\le X \le 6)$, which equals $P(X=3)+P(X=4)+P(X=5)+P(X=6)$.  
According to Poisson distribution, we can get:  
$$
\begin{align*}

P(3\le X \le 6) 
&= P(X=3)+P(X=4)+P(X=5)+P(X=6)\\ 
&= \frac{e^{-5}\times5^{3}}{3!}+\frac{e^{-5}\times5^{4}}{4!}+\frac{e^{-5}\times5^{5}}{5!}+\frac{e^{-5}\times5^{6}}{6!}\\
&= \frac{e^{-5}\times5^{3}}{3!}+\frac{e^{-5}\times5^{4}}{4!}+\frac{e^{-5}\times5^{5}}{5!}+\frac{e^{-5}\times5^{6}}{6!}\\
&= \frac{125e^{-5}}{6}+\frac{625e^{-5}}{24}+\frac{3125e^{-5}}{120}+\frac{15625e^{-5}}{720}\\
&= \frac{13625}{144}e^{-5}\\
& \approx0.6375

\end{align*}
$$  
So the probability should be 0.6375.

## 1(c)
To find the minutes make the probability exceed $\frac{1}{4}$, we should first consider $Y$ as the number of tickets recived in $t$ minutes, and the new expectation should be $\lambda_t = \frac{t}{12}$.  
We could get an expression to find $t$:  
$$
\begin{align*}
&P(Y\ge1) > \frac{1}{4}\\
&P(Y\ge1) = 1 - P(Y=0)\\
\end{align*}
$$
So we could get:  
$$
\begin{align*}
1 - P(Y=0) &> \frac{1}{4}\\
1 - e^{-\lambda_t} &> \frac{1}{4}\\
e^{-\lambda_t} &< \frac{3}{4}\\
-\lambda_t &< \ln(\frac{3}{4})\\
\lambda_t &> -\ln(\frac{3}{4})\\
\end{align*}
$$
Since $\lambda_t = \frac{t}{12}$,
$$
t > -12\ln(\frac{3}{4}) \approx 3.4522
$$  
So it would be approximately 3 minutes and 27 seconds to make the probability exceed $\frac{1}{4}$.

## Assignment3 - Question 2
### 2(a)
$$
\begin{align*}

E[X] &= \sum_{i=1}^{n}P(X=x_i) \cdot x_i\\
&= P(X=-4) \times (-4) + P(X=-2) \times (-2) + P(X=-1) \times P(-1) + P(X=0) \times 0 + P(X=1) \times 1\\
&= 0.05 \times (-4) + 0.1 \times 2 + 0.15 \times -1 + 0.2 \times 0 + 0.5 \times 1\\
&= -0.2 + -0.2 + -0.15 + 0 + 0.5\\
&= -0.05

\end{align*}
$$

### 2(b)
$$
\begin{align*}

var(X) &= E[(X-E[X])^2]\\
&= \sum_{i=1}^{n} P(X=x_i)\cdot(x_i-E[X])^2\\
&= P(X=-4) \times [-4-(-0.05)]^2 + P(X=-2) \times [-2-(-0.05)]^2 + P(X=-1)\times [-1-(-0.05)]^2 + P(X=0) \times [0-(-0.05)]^2 + P(X=1) \times [1-(-0.05)]^2\\
&= 0.05 \times (-3.95)^2 + 0.1 \times (-1.95)^2 + 0.15 \times (-0.95)^2 + 0.2 \times 0.05^2 + 0.5 \times 1.05^2\\
&= 1.8475

\end{align*}
$$

### 2(c)
$$
\begin{align*}

var(X) &= E[X^2]-E[X]^2\\
&= \sum_{i=1}^{n}P(X=x_i)\cdot{x_i}^2-E[X]^2\\
&= P(X=-4)\times(-4)^2 + P(X=-2)\times(-2)^2 + P(X=-1)\times(-1)^2 + P(X=0)\times0^2 + P(X=1)\times1^2-0.05^2\\
&= 0.05\times16 + 0.1\times4 + 0.15\times1 + 0.2\times0 + 0.5\times1 - 0.0025\\
&= 1.8475
\end{align*}
$$