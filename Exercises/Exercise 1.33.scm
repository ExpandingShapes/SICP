(define (inc a) (+ a 1))
(define (identity a) a)
(define (square a) (* a a))
(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
      ((divides? test-divisor n) test-divisor)
      (else (find-divisor n (+ test-divisor 1)))))
  (find-divisor n 2))

(define (prime? n) 
  (= n (smallest-divisor n)))

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (filter a)
        (if (> a b)
            result
            (iter (next a) (combiner (term a) result)))
        (iter (next a) result)))
  (iter a null-value))
  
;a subtask

(define (sum term a next b filter)
  (filtered-accumulate + 0 term a next b filter))

(define (sum-of-squared-primes a b)
  (sum square a inc b prime?))
  
;a subtask
;b subtask

(define (product term a next b filter)
  (filtered-accumulate * 1 term a next b filter))

(define (prod-b n)
  (define (filter-b a)
    (or (prime? a) (prime? n)))
  (product identity 1 inc (- n 1) filter-b))
;b subtask
