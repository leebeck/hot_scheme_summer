Exercise 1.10: The following procedure computes a mathematical function called Ackermann’s function.

(define (A x y) (cond ((= y 0) 0)
((= x 0) (* 2 y))
((= y 1) 2)
(else (A (- x 1) (A x (- y 1))))))

What are the values of the following expressions?

(A 1 10)

(A 2 4)

(A 3 3)

Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (k n) (* 5 n n))

Give concise mathematical definitions for the functions com- puted by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5n^2.

Answers:

(1) (A 1 10) --> 1024

(2) (A 2 4) --> 65536

(3) (A 3 3) --> 65536

(4) (f n) computes 2n 

(5) (g n) computes 2*2*2... n times = 2^n

(6) (h n) --> (A 2 n) --> (A 1 (A 2 (n-1))) --> (g (A 2 (n-1))) --> 2^((A 2 (n-1))) --> 2^(h (n-1)) --> 2^(2^(2...)) with n embedded exponentiations of 2. Note that the parenthesis are necessary to get the right-to-left order of operations.

(7) (k n) computes 5n^2 (answer given in text)

