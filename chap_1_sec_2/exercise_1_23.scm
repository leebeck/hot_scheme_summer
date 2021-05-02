
(define (next n)
  (if (= n 2)
      3
      (+ 2 n)))

(define (square n) (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n) ; if no divisors below sqrt, then n is prime
        ((divides? test-divisor n) test-divisor) ; if test-divisor divides, then it's smallest
  (else (find-divisor n (next test-divisor ))))) ; else increment and go again

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
(search-for-primes 1000 1100)

1001
1003
1005
1007
1009 *** 5
1011
1013 *** 5
1015
1017
1019 *** 4

(search-for-primes 10000 10050)

10001
10003
10005
10007 *** 11
10009 *** 12
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
10037 *** 8

(search-for-primes 1000000 1000050)

1000001
1000003 *** 121
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
1000033 *** 126
1000035
1000037 *** 124

#|
