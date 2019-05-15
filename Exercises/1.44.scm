(define (average-of-3 a b c) (/ (+ a b c) 3))

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (if (> n 1)
      (compose f (repeated f (- n 1)))
      f))

;let dx be 0.01
(define (smooth f) (lambda (x) (average-of-3
                                   (f (- x 0.01))
                                   (f x)
                                   (f (+ x 0.01)))))

(define (smooth-n-fold f n) (repeated (smooth f) n))
