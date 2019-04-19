(define (average x y) (/ (+ x y) 2))
(define tolerance 0.00001)


(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;without average damping
(define (f-36-no-avg-damp)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))

;with average-damping
(define (f-36-avg-damp)
  (fixed-point (lambda (x) (average x (/ (+ 1 x) x))) 2.0))

;35 steps
(display (f-36-no-avg-damp))
(newline)
(newline)
;11 steps
(display (f-36-avg-damp))
