(define (positive? x) (> x 0))
(define (negative? x) (< x 0))
(define (average x y) (/ (+ x y) 2))
(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

;using the half-interval method to approximate pi
;as the root between 2 and 4 of sinx = 0

(display (half-interval-method sin 2.0 4.0))

;using the half-interval method to search for a root
;of the equation x3 - 2x - 3 = 0 between 1 and 2

(display (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)))
         1.0
         2.0)
