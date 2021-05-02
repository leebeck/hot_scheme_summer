; adapting http://community.schemewiki.org/?sicp-ex-1.33

(define (square n) (* n n))

(define (smallest-div n) 
    (define (divides? a b) 
      (= 0 (remainder b a))) 
    (define (find-div n test) 
       (cond ((> (square test) n) n) ((divides? test n) test) 
             (else (find-div n (+ test 1))))) 
    (find-div n 2)) 
  
   (define (prime? n) 
     (if (= n 1) false (= n (smallest-div n)))) 

(define (gcd m n) 
   (cond ((< m n) (gcd n m)) 
         ((= n 0) m) 
         (else (gcd n (remainder m n))))) 

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a) ; if filter condition is true then return
          (combiner
           (term a) ; combining a
           (filtered-accumulate combiner null-value term (next a) next b filter))
          ;else return this
          (combiner
           null-value ; combining null value
           (filtered-accumulate combiner null-value term (next a) next b filter))
      )
  )
)

(define (sum-of-squared-primes a b) (filtered-accumulate + 0 square a inc b prime?))

(define (prod-relative-primes-under n)
  (define (relative-prime? m n) (= (gcd m n) 1))
  (define (relative-prime-to-n? x) (relative-prime? x n)) ; this begs for lambda treatment right?
  (filtered-accumulate * 1 identity 1 inc n relative-prime-to-n?)
)
