_2.13: Show that under the assumption of small
percentage tolerances there is a simple formula for the ap-
proximate percentage tolerance of the product of two in-
tervals in terms of the tolerances of the factors. You may
simplify the problem by assuming that all numbers are pos-
itive.
After considerable work, Alyssa P. Hacker delivers her ﬁn-
ished system. Several years later, after she has forgotten all
about it, she gets a frenzied call from an irate user, Lem E.
Tweakit. It seems that Lem has noticed that the formula for
130parallel resistors can be wrien in two algebraically equiv-
alent ways:
(R1 x R2)/(R1 + R2) and
1/(1/R1 + 1/R2)
He has written the following two programs, each of which
computes the parallel-resistors formula diﬀerently:_
```scheme
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
                
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
    one (add-interval (div-interval one r1)
                      (div-interval one r2)))))
```
_Lem complains that Alyssa’s program gives diﬀerent an-
swers for the two ways of computing. This is a serious com-
plaint._

Solution:
