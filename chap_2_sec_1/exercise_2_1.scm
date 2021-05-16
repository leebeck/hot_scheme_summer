; using http://community.schemewiki.org/?sicp-ex-2.1

(define (make-rat n d) 
   (define (sign x) (if (< x 0) - +)) 
   (let ((g (gcd n d))) 
     (cons ((sign d) (/ n g)) 
               (abs (/ d g))))) 
         
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
(make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
(make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
(make-rat (* (numer x) (numer y))
(* (denom x) (denom y)))) (define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
(= (* (numer x) (denom y))
     (* (numer y) (denom x))))


(define one-half (make-rat 1 2))

(define one-third (make-rat 1 3))

(print-rat (make-rat -2 -3))
(print-rat (make-rat 2 -3))
