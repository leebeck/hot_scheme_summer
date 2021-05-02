(define (product term a next b)
  (if (> a b)
      1 ; 1 is the multiplicative identity
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

#| doesn't work
(define (pi-approx n)
  (define (square k) (* k k))
  (define (add-two k) (+ k 2))
  (* 2.0 (/ (product square 2 add-two n) (product square 3 add-two n))))
|#

; adapting http://community.schemewiki.org/?sicp-ex-1.31

 (define (pi-term n) 
   (if (even? n) 
       (/ (+ n 2) (+ n 1)) 
       (/ (+ n 1) (+ n 2))))
; > (* (product pi-term 1 inc 1000) 4.0)
; 3.1431607055322663
