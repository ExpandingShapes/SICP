;linear recursive process
(define (expt-recursive b n)
 (if (= n 0)
 1
 (* b (expt-recursive b (- n 1)))))

;linear iterative process
(define (expt-iterative b n)
  (define (iter b counter product)
   (if (= counter 0)
   product
   (iter b
    (- counter 1)
    (* b product))))
 (iter b n 1))

;logarithmical order of growth
(define (square x) (* x x))
(define (even? n)
 (= (remainder n 2) 0))
(define (fast-expt b n)
 (cond ((= n 0) 1)
  ((even? n) (square (fast-expt b (/ n 2))))
  (else (* b (fast-expt b (- n 1))))))
