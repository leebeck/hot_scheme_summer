Exercise 1.15: The sine of an angle (specified in radians) can be computed by making use of the approximation sin x ~ x if x is sufficiently small, and the trigonometric identity

sin(x) = 3 * sin x/3 − 4 * sin(x/3)^3

to reduce the size of the argument of sin. (For purposes of this exercise an angle is considered “sufficiently small” if its magnitude is not greater than 0.1 radians.) These ideas are incorporated in the following procedures:

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x)))) (define (sine angle)
(if (not (> (abs angle) 0.1)) angle
(p (sine (/ angle 3.0)))))

a. How many times is the procedure p applied when (sine 12.15) is evaluated?

b. What is the order of growth in space and number of steps (as a function of a) used by the process generated by the sine procedure when (sine a) is evaluated?

Answers:

(a) six times because 12.15/3/3/3/3/3 = 0.05 is the first angle for which sin(x)~x approximation is close enough to use.

(b) order of growth in the number of steps is log (base 3), as each three-fold increase in angle requires another another step. it doesn't seem like tail-recursion is possible here (?), so process has order of growth that is log also--?