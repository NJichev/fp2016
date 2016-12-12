#lang racket
(define (square x)
  (* x x))

(define (square-sum a b)
  (+ a b))

(define (triangle? a b c)
  [and (> (+ a b) c)
       (> (+ b c) a)
       (> (+ a c) b)]
  )

(define (sum-square-eql? a b c)
  [= (+ (* a a)
        (* b b))
     (* c c)])

(define (pyth? a b c)
  [or (sum-square-eql? a b c)
      (sum-square-eql? b c a)
      (sum-square-eql? c a b)]
  )
;
; Факториел, написан чрез if
(define (fact2 n)
  [if (zero? n)
    1
    (* n (fact2 (- n 1)))
    ]
  )

; Факториел, написан чрез cond
(define (fact n)
  (cond
    [(zero? n) 1]
    [else (* n (fact (- n 1)))]
    )
  )
;
(define (sum-digits n)
  [if (< n 10)
    n
    (+
      (remainder n 10)
      (sum-digits (quotient n 10)))
    ]
  )
;
(define (product-digits n)
  [if (< n 10)
    n
    (*
      (remainder n 10)
      (product-digits (quotient n 10)))
    ]
  )

; Лице на триъгълник
(define (area a b c)
  (let
    ([p (/  ; poluperimetur
          (+ a b c)
          2)])
      (sqrt (*
              p
              (- p a)
              (- p b)
              (- p c)))
    )

  )
;
; (define (prime? n)
;   (void))
(square 12)

(square-sum 3 4)

(triangle? 5 13 12)
(triangle? 5 12 13)
(triangle? 12 5 13)

(+ (* 1 2 3 4 5)
   (* 8 (- 5 3)))


(pyth? 3 4 5)
(pyth? 3 4 8)
(pyth? 5 12 13)

(fact2 10)
(fact 10)
(display "Sum digits of 123 and 12345\n")
(sum-digits 12345)
(sum-digits 123)
(display "Products of 123 and 12345\n")
(product-digits 123)
(product-digits 12345)

(display "Area of triangle with sides 3 4 5\n")
(area 3 4 5)
(area 5 12 13)
