(define (identity x) x)
(define (inc x) (+ x 1))

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive combiner null-value term (next a) next b))))

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        null-value
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))
