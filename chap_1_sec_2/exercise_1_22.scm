#lang sicp

#| Exercise 1.22: Most Lisp implementations include a prim- itive called runtime that returns an integer that specifies the amount of time the system has been running (mea- sured, for example, in microseconds). The following timed- prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test. |#
(define (square n) (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n) ; if no divisors below sqrt, then n is prime
        ((divides? test-divisor n) test-divisor) ; if test-divisor divides, then it's smallest
  (else (find-divisor n (+ test-divisor 1))))) ; else increment and go again

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n) ; steps order of growth is sqrt(n)
  (= n (smallest-divisor n))) ; n is prime iff n is its own smallest divisor

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes lower upper)
  (if (even? lower)
      (search-for-primes (+ 1 lower) upper) ; if lower is even, increment and go again
      (cond ((> lower upper) 
             (newline) (display "done")) ; if lower exceeds upper, we're done
            (else (timed-prime-test lower) ; otherwise test if lower is prime
                  (search-for-primes (+ 2 lower) upper))))) ; then increment by two and go again

#|
> (search-for-primes 1000 1100)
1001
1003
1005
1007
1009 *** 6
1011
1013 *** 6
1015
1017
1019 *** 6

(search-for-primes 10000 10050)

10001
10003
10005
10007 *** 13
10009 *** 13
10011
10013
10015
10017
10019
10021
10023
10025
10027
10029
10031
10033
10035
10037 *** 12

(search-for-primes 1000000 1000050)

1000001
1000003 *** 7402
1000005
1000007
1000009
1000011
1000013
1000015
1000017
1000019
1000021
1000023
1000025
1000027
1000029
1000031
1000033 *** 112
1000035
1000037 *** 110
|#
