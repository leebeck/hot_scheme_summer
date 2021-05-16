; using http://community.schemewiki.org/?sicp-ex-2.2

(define (make-point x y) (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))
(define (midpoint-segment segment)
  (define (avg a b) (/ (+ a b) 2.0))
  (let ((a (start-segment segment))
        (b (end-segment segment)))
    (make-point (avg (x-point a) (x-point b))
                (avg (y-point a) (y-point b)))))

(define seg (make-segment (make-point -2 4)
                          (make-point 6 8)))

(print-point (midpoint-segment seg))
