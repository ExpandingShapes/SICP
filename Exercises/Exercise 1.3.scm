(define (proced a b c)
  (define (square x) (* x x))
  (if (and (equal? a b) (equal? b c))
     'All three numbers cannot be equal to each other
    (cond ((and (< a b) (< a c)) (+ (square b) (square c)))
          ((and (< b a) (< b c)) (+ (square a) (square c)))
          ((and (< c a) (< c b)) (+ (square a) (square b)))
          (else 'There cannot be two least equal numbers given)
          ))
  )