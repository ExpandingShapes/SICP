(define (make-interval a b) (cons a b))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))

(define (width interval) (/ (- (upper-bound interval)
                               (lower-bound interval))
                           2))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
             
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
             
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2 p3 p4)
                 (max p1 p2 p3 p4))))
             
(define (div-interval x y)
  (mul-interval
  x
  (make-interval (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y)))))
             
;Tests
(define x-interval (make-interval 6 8))
(define y-interval (make-interval 7 13))

;must be #t
(display (= (abs (width (add-interval x-interval y-interval)))
            (abs (+ (width x-interval) (width y-interval)))))
        
(newline)
        
;must be #t
(display (= (abs (width (sub-interval x-interval y-interval)))
            (abs (- (width x-interval) (width y-interval)))))
        
(newline)

;must be #f
(display (= (abs (width (mul-interval x-interval y-interval)))
            (abs (* (width x-interval) (width y-interval)))))

(newline)

;must be #f
(display (= (abs (width (div-interval x-interval y-interval)))
            (abs (/ (width x-interval) (width y-interval)))))
