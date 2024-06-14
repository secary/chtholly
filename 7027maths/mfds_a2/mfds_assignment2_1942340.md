<h1 style="text-align: center;">Mathematical Foundations of Data Science Assignment 2</h1>

### Trimester 2，2024
### Dongju Ma

## Q1
###  (a)
To arrange the labourers into 5 groups of 3, we should pick 3 random guys from the origin 15 people, then 3 random guys from the 12 people left, etc. So the expression of this process should be:
$$
\frac{\binom{15}{3} \times \binom{12}{3} \times \binom{9}{3}\times \binom{6}{3} \times \binom{3}{3} }{5!}
$$
which equals 1401400.

And the each team should have different task with others, we should multiple the result before with all the permutions the assign ways have, which is 
$$
1401400\times5!\times4!\times3!\times2!\times1!
$$
which equals 16816800
