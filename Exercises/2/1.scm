(define (abs x)
  (if (< x 0)
      (- x)
      x))
      
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (abs (/ n g)) (/ d g))))
