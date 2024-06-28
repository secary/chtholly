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