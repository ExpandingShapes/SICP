(define (make-rat2 n d)
  (let ((g (gcd n d)))
    (if (or (and (> n 0) (> d 0)) (and (< n 0) (< d 0)))
        (cons (abs (/ n g)) (abs (/ d g)))
        (cons (- (abs (/ n g))) (abs (/ d g))))))