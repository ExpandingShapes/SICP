(define (even? x) (= (remainder x 2) 0))
(define (double x) (+ x x))
(define (halve x)
  (if (even? x)
      (/ x 2)
      "Error: Not an even number!"))

;works for natural nubers only
(define (* a b)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= b 1) a)
        ((even? b) (double (* a (halve b))))
        (else (+ a (* a (- b 1))))))
