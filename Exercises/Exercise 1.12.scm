(define (triangle raw col)
  (define (is-last-column raw col)
  (if (= raw col)
      #t
      #f))
  
  (if (or (< raw 1) (< col 1) (> col raw))
      "Incorrect input"
      (cond ((and (= raw 1) (= col 1)) 1)
            ((= col 1) 1)
            ((is-last-column raw col) 1)
            (else (+ (triangle (- raw 1) (- col 1)) 
                     (triangle (- raw 1) col))))))
