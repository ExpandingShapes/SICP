#lang scheme
(define (make-interval a b) (cons a b))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (lower interval) (lower-bound interval))
(define (upper interval) (upper-bound interval))

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
  (cond ((and (< (lower x) 0) (< (upper x) 0) (< (lower y) 0) (< (upper y) 0)) (make-interval (* (lower x) (lower y)) (* (upper x) (upper y))))
        ((and (< (lower x) 0) (< (upper x) 0) (< (lower y) 0) (> (upper y) 0)) (make-interval (* (upper x) (upper y)) (* (upper x) (lower y))))
        ((and (< (lower x) 0) (< (upper x) 0) (> (lower y) 0) (> (upper y) 0)) (make-interval (* (upper x) (upper y)) (* (lower x) (lower y))))
        ((and (< (lower x) 0) (> (upper x) 0) (< (lower y) 0) (< (upper y) 0)) (make-interval (* (upper x) (upper y)) (* (lower x) (upper y))))
        ((and (< (lower x) 0) (> (upper x) 0) (< (lower y) 0) (> (upper y) 0)) (make-interval (* (lower x) (upper y)) (* (upper x) (upper y))))
        ((and (< (lower x) 0) (> (upper x) 0) (> (lower y) 0) (> (upper y) 0)) (make-interval (* (lower x) (upper y)) (* (upper x) (upper y))))
        ((and (> (lower x) 0) (> (upper x) 0) (< (lower y) 0) (< (upper y) 0)) (make-interval (* (upper x) (upper y)) (* (lower x) (lower y))))
        ((and (> (lower x) 0) (> (upper x) 0) (< (lower y) 0) (> (upper y) 0)) (make-interval (* (upper x) (lower y)) (* (upper x) (upper y))))
        ((and (> (lower x) 0) (> (upper x) 0) (> (lower y) 0) (> (upper y) 0)) (make-interval (* (lower x) (lower y)) (* (upper x) (upper y))))))
             
(define (div-interval x y)
  (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
      (error "Dividing by an interval that spans zero is prohibited!")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))
      )
  )
             
;Tests
;NO
(display (mul-interval (make-interval (- 4) (- 5))
                       (make-interval (- 2) (- 3))))
(newline)
;NO
(display (mul-interval (make-interval (- 4) (- 5))
                       (make-interval (- 2) 3)))
(newline)
;NO
(display (mul-interval (make-interval (- 4) (- 5))
                       (make-interval 2 3)))
(newline)
;NO
(display (mul-interval (make-interval (- 4) 5)
                       (make-interval (- 2) (- 3))))
(newline)
(display (mul-interval (make-interval (- 4) 5)
                       (make-interval (- 2) 3)))
(newline)
(display (mul-interval (make-interval (- 4) 5)
                       (make-interval 2 3)))
(newline)
;NO
(display (mul-interval (make-interval 4 5)
                       (make-interval (- 2) (- 3))))
(newline)
(display (mul-interval (make-interval 4 5)
                       (make-interval (- 2) 3)))
(newline)
(display (mul-interval (make-interval 4 5)
                       (make-interval 2 3)))
(newline)
;what if 0?
(display (mul-interval (make-interval 0 5)
                       (make-interval 2 3)))
