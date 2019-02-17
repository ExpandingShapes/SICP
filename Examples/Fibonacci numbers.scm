(define (fib n)
  (if (< n 2) 
    n 
    (+ (fib (- n 1)) (fib (- n 2)))))
;;Using tail recursion
(define (fib-tail n)
  (define (fib-iter n a b)
    (if (= n 0)
      a
    (if (= n 1)
      b
      (fib-iter (- n 1) b (+ a b)))))
  (fib-iter n 0 1))
