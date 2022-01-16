(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (first-denomination kinds-of-coins) (car kinds-of-coins))
(define (except-first-denomination kinds-of-coins) (cdr kinds-of-coins))
(define (no-more? kinds-of-coins) (null? kinds-of-coins))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination
                 coin-values))
            (cc (- amount
                   (first-denomination
                    coin-values))
                coin-values)))))

;tests
(display (cc 100 us-coins))
(newline)
(display (cc 100 uk-coins))
