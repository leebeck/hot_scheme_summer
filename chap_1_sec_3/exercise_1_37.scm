(define (cont-frac n d k)
  (cond ((= k 0) 0) ; rock bottom
        (else (/ (n k) (+ (d k) (cont-frac n d (dec k)))))))


#| 11 terms to get four digits
> (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
0.6180555555555556
|#
