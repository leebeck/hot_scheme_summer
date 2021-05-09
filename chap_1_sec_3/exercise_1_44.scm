#|
Exercise 1.44: e idea of smoothing a function is an im- portant concept in signal processing. If f is a function and dx is some small number, then the smoothed version of f is the function whose value at a point x is the average of f (x − dx ), f (x ), and f (x +dx ). Write a procedure smooth that takes as input a procedure that computes f and returns a proce- dure that computes the smoothed f . It is sometimes valu- able to repeatedly smooth a function (that is, smooth the smoothed function, and so on) to obtain the n-fold smoothed function. Show how to generate the n-fold smoothed func- tion of any given function using smooth and repeated from Exercise 1.43.
|#

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (avg3 a b c)
  (/ (+ a b c) 3))

(define (smooth f)
  (lambda (x) (avg3
               (f (- x dx))
               (f x)
               (f (+ x dx)))))

; n-fold smoothed function
(define (n-fold-smoothed f n)
  (lambda (x) ((repeated (smooth f) n) x)))
