(define (even? x) (= (remainder x 2) 0))

(define (square x) (* x x))
(define (cube x) (* x x x))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (* (/ h 3) (sum f a b n h)))

(define (sum f a b n h)
  (define (yn f a n) (f (+ a (* n h))))
  (if (> n 0)
      ;yn...y1
      (cond ((or (= n 0) (= n (/ (- b a) h)))
             (+ (yn f a n) (sum f a b (- n 1) h)))
          ((even? n)
           (+ (* 2 (yn f a n)) (sum f a b (- n 1) h)))
          (else
           (+ (* 4 (yn f a n)) (sum f a b (- n 1) h))))
      ;y0
      (yn f a 0)))
