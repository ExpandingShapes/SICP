;      __
;left |  |
;     |__|
;     lower
(define (make-rectangle-1 left-segment lower-segment) (cons left-segment lower-segment))
(define (first-rectangle rectangle) (car rectangle))
(define (second-rectangle rectangle) (cdr rectangle))

; upper
;  __
; |  | right
; |__|
(define (make-rectangle-2 upper-segment right-segment) (cons upper-segment right-segment))
(define (first-rectangle rectangle) (car rectangle))
(define (second-rectangle rectangle) (cdr rectangle))

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment));
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (perimeter-rectangle rectangle) (* (+ (abs (- (y-point (start-segment (first-rectangle rectangle)))
                                                      (y-point (end-segment (first-rectangle rectangle)))))
                                              (abs (- (x-point (start-segment (second-rectangle rectangle)))
                                                      (x-point (end-segment (second-rectangle rectangle))))))
                                           2))
                                       
(define (area-rectangle rectangle) (* (abs (- (y-point (start-segment (first-rectangle rectangle)))
                                              (y-point (end-segment (first-rectangle rectangle)))))
                                      (abs (- (x-point (start-segment (second-rectangle rectangle)))
                                              (x-point (end-segment (second-rectangle rectangle)))))))

;Testing                                  
;y
;^
;|
;|___
;|   |
;|___|_______>x
(define my-rectangle-1 (make-rectangle-1 (make-segment (make-point 0 2) (make-point 0 0))
                                           (make-segment (make-point 0 0) (make-point 3 0))))
(define my-rectangle-2 (make-rectangle-2 (make-segment (make-point 0 2) (make-point 0 0))
                                           (make-segment (make-point 0 0) (make-point 3 0))))

(display "P1 = ")
(display (perimeter-rectangle my-rectangle-1))
(display " , P2 = ")
(display (perimeter-rectangle my-rectangle-2))    
(newline)
(display "S1 = ")
(display (area-rectangle my-rectangle-1))
(display " , S2 = ")
(display (area-rectangle my-rectangle-2))  
