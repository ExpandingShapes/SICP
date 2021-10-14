(define (abs x)
  (if (< x 0)
      (- x)
      x))
      
(define (make-rat n d)
  (let ((g (gcd n (abs d))))
    (cons (/ n g) (abs (/ d g)))))
