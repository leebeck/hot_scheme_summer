#lang sicp

; Exercise 1.21: Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.

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

#|
ANSWERS:
> (smallest-divisor 199)
199
> (smallest-divisor 1999)
1999
> (smallest-divisor 19999)
7
|#
