(define (cube n) (* n n n))

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a)
         (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-cubes2 a b)
  (sum cube a inc b))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

; adapting http://community.schemewiki.org/?sicp-ex-1.29
(define (integral-simp f a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ x (* 2 h))) ; add 2h (for odd subscript and for even subscripts)
  (* (/ h 3.0) (+ (f a) ; first term
                  (* 4.0 (sum f (+ a h)       next b))
                  (* 2.0 (sum f (+ a (* 2 h)) next (- b h)))
                  (f b))))
#|
> (integral cube 0 1 (/ 1 100))
0.24998750000000042
> (integral cube 0 1 (/ 1 1000))
0.249999875000001
> (integral-simp cube 0 1 100)
0.25
> (integral-simp cube 0 1 1000)
0.25
|#
