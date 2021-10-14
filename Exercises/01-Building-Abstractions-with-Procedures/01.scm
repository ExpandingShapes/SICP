(display "10 is ")
(display 10)
(newline)
(newline)

(display "(+ 5 3 4) is ")
(display 12)
(newline)
(newline)

(display "(- 9 1) is ")
(display 8)
(newline)
(newline)

(display "(/ 6 2) is ")
(display 3)
(newline)
(newline)

(display "(+ (* 2 4) (- 4 6)) is ")
(display 6)
(newline)
(newline)


(define a 3)
(define b (+ a 1))

(display "(+ a b (* a b)) is ")
(display 19)
(newline)
(newline)

(display "(= a b) is ")
(display "#f")
(newline)
(newline)

(display "(if (and (> b a) (< b (* a b)))\n    b\n    a) is ")
(display 4)
(newline)
(newline)

(display "(cond ((= a 4) 6)\n      ((= b 4) (+ 6 7 a))\n      (else 25)) is ")
(display 16)
(newline)
(newline)

(display "(+ 2 (if (> b a) b a)) is ")
(display 6)
(newline)
(newline)

(display "(* (cond ((> a b) a)\n         ((< a b) b)\n         (else -1))\n   (+ a 1)) is ")
(display 16)
