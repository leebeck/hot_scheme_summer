(define (cont-frac n d k)
  (cond ((= k 0) 0) ; rock bottom
        (else (/ (n k) (+ (d k) (cont-frac n d (dec k)))))))


; adapting http://community.schemewiki.org/?sicp-ex-1.38

(define (e-euler k) 
   (+ 2.0 (cont-frac (lambda (i) 1) ; e_minus_2_n = 1, 1, 1, ...
                     (lambda (i)    ; ; e_minus_2_d = 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8
                       (cond ((= (modulo i 3) 0) 1      )
                             ((= (modulo i 3) 1) 1      )
                             ((= (modulo i 3) 2) (* 2 i)))
                     k))))
                     

; this doesn't work :-/
