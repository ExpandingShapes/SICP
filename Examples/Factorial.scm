(define (factorial-linear-recursive n)
  (if (= n 1)
  1
 (* n (factorial-linear-recursive (- n 1)))))

(define (factorial-linear-iterative n)
  (define (fact-iter product counter max-count)
    (if (> counter max-count)
    product
    (fact-iter (* counter product)(+ counter 1) max-count)))
  (fact-iter 1 1 n))

(factorial-linear-iterative 6)