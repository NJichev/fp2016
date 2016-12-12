#lang racket

; (define (sum-digits n)
;   [if (< n 10)
;     n
;     (+
;       (remainder n 10)
;       (sum-digits (quotient n 10)))
;     ]
;   )

(define (get-operation str)
  (cond
    [(equal? str "plus") +]
    [(equal? str "minus") -]
    [(equal? str "mult") *]
    [(equal? str "div") /]
    [else (lambda (x y) x)]
    )
  )


(define (twice f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))
(define (inc2 x) ((twice inc) x))

(define (min-f f g)
  (lambda (x)
    [min (f x) (g x)]))

(min-f inc inc2)
((min-f inc inc2) 1)

(define (square-cube)
  (lambda (x)
    (+
      (* x x)
      (* (x (* x x)))))
  )

(define (generic-sum)
  (lambda (a b f)
    (map f (build-list a b)))
  )

(define (sum1 n)
  ((generic-sum) 1 n square-cube))

(sum1 2)
; (define (sum-digits n) (sum-digits n 1))
;
; (deifne (sum-digits n acc)
;         [if (n < 10)
;           n
;           (sum-digits (remainder n 10) (+ acc (quotient n 10)))
;           ]
;         )
; sum-digits(12345)



; sum for all ints in [a, b]
; (define (sum-range a b)
;   (void))
;
; (define (sum-divisors n)
;   (void))
;
; (define (prime? n)
;   (void))
;
; (define (int-reverse n)
;   (void))
;
