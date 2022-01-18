(define (make-center-percent center percentage)
  (make-interval (- center (/ (* center percentage) 100))
                 (+ center (/ (* center percentage) 100))))

(define (percent interval)
 (/ (center interval)
    (- (center interval) (lower-bound interval))))

;tests
(define test-interval (make-center-percent 6.8 10))
(display test-interval)
(newline)
(display (percent test-interval))
