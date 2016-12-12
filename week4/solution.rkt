#lang racket
(define (range a b)
  (if (> a b)
    '()
    (cons a (range (+ a 1) b))))

(define (length2 xs)
  (if (empty? xs)
    0
    (+ 1 (length2 (rest xs)))))

(define (member? y xs)
  (not (empty? (filter (lambda (x) (equal? x y)) xs))))

(define (sum items)
  (apply + items))

(define (member2? y xs)
  (cond
    [(empty? xs) #f]
    [(equal? y (first xs)) #t]
    [else (member? y (rest xs))]))

(member? 1 '(1 2 3 4))
(member? 1 '(2 3 4))

; (define (reverse2 items)
;   )
;
(define (take-while f items)
  (if (f (first items))
    (cons (first items) (take-while f (rest items)))
    '()))

; (take-while zero? (list 0 0 0 1 2 3))
; (take-while even? (list 2 4 5 7 8 3 2))
; (take-while (lambda (x) (> x 3)) (list 1 1 1 1 1))

(define (drop-while f items)
  (if (f (first items))
    (drop-while f (rest items))
    items))

(drop-while zero? (list 0 0 0 1 2 3))
; '(1 2 3)
(drop-while even? (list 2 4 5 7 8 3 2))
; '(5 7 8 3 2)
(drop-while (lambda (x) (> x 3)) (list 1 1 1 1 1))
; '(1 1 1 1 1)

(define (reverse2 xs)
  (define (reverse-list l1 l2)
    (if (empty? l1)
      l2
      (reverse-list (rest l1) (cons (first l1) l2))))
  (reverse-list xs (list)))

(define (list-ref2 xs index)
  (if (empty? xs)
    (void)
    (if (= index 0)
      (first xs)
      (list-ref2 (rest xs) (- index 1)))))

(list-ref2 '(1 2 3 4 5) 6)

(reverse2 '(1 2 3 4 5))
