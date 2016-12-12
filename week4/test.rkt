#lang racket
(define (reduce z xs oper)
  (if (empty? xs)
    z
    (reduce (oper z (first xs)) (rest xs) oper)))

(define (join delim strs)
  (reduce "" strs (lambda (acc x) (string-append acc delim x))))


(join " " (list "a" "b" "c"))
