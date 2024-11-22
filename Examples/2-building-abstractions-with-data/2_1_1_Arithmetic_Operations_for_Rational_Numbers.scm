; Definitions
; With gcd we can reduce the numerator and the denominator to lowest terms
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))
(define (numer x) (car x))
(define (denom x) (cdr x))

; Or we could perform the reduction whenever we access the parts of a
; rational number, rather than when we construct it.
(define (make-rat-alt n d) (cons n d))
(define (numer-alt x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (car x) g)))
(define (denom-alt x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (cdr x) g)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

; Testing

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(print-rat one-half)
(print-rat (add-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
(print-rat (add-rat one-third one-third))
