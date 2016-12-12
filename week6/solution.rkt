#lang racket
(require racket/set)

; (define (increasing? ns)
;   (cond [(empty? ns) #t]
;         [(empty? (rest ns)) #t]
;         [else (and (<= (first ns) (second ns)) (increasing? (rest ns)))]))

; (define (increasing? ns)
;   (equal? ns (sort ns <=)))
; (increasing? (list 1 2 3 4 5))
; (increasing? (list 1 2 3 4 0))

; (define (decreasing? ns)
;   (equal? ns (sort ns >=)))
;
; (increasing? (list 1 2 3 4 5))
; (decreasing? (list 5 4 3 2 1))
;
;
; (define (count y xs)
;   (foldl + 0 (map (lambda (x) (if (equal? x y)
;                      1
;                      0))
;        xs)))
;
; (define (count2 y xs)
;   (length (filter (lambda (x) (equal? x y)) xs)))
;
; (define (count3 y xs)
;   (length (filter (curry equal? y) xs)))
;
; (count 1 (list 1 2 3 4 5 4 3 2 1))
;
; (count2 1 (list 1 2 3 4 5 4 3 2 1))
;
; (count3 1 (list 1 2 3 4 5 4 3 2 1))
;
; (define (dedup xs)
;   (set->list (list->set xs)))
;
; (dedup (list 1 2 3 4 1 2 3 4))
;
(define A (list (list 1 2 3)
                (list 4 5 6)
                (list 7 8 9)))

(define (sum-matrix mns)
  (apply + (map (lambda (ms) (apply + ms)) mns)))


(sum-matrix A)
;
; (define (transpose xs)
;   (apply map list xs))
;
; (define (get-row2 n matrix)
;   (list-ref matrix n))
;
; (define (get-row n matrix)
;   (if (zero? n)
;     (first matrix)
;     (get-row (- n 1) (rest matrix))))
;
; (define (get-column n matrix)
;   (get-row n (transpose matrix)))
;
; (get-row 1 A)
; (get-row2 1 A)
; (get-column 1 A)
;
; (define (get-element x y matrix)
;   (list-ref (get-row x matrix) y))
;
; (get-element 1 1 A)
;
; (define (main-diagonal matrix)
;   (void))
;
;
;
;
;
;
;
; (define (id x) x)
;
; (define (get-ids )
;   )
;
; (define (index-board w h)
;   (cons ))
;
; (index-board 3 4)
; ; 0 1 2 3 4
; ; 0 1 2 3 4 5
;
;
;
; (define (get-element x y mns)
;   (list-ref (list-ref mns x) y))
;
; (get-element 1 1 A)

; Задача 4. Да се дефинира функция (pair-compose fs), която получава списък 
; (f1 f2 f3 ... fn) от едноаргументни числови функции и връща нова едноаргументна числова функция g - такава, че оценката на (g x) е равна на сумата 
; (f1 . f2) (x) + (f3 . f4) (x) + ... + (fn-1 . fn) (x), където “.” означава композиция на функции.
; Ако оригиналният списък с функции има нечетен брой елементи, то последната функция от списъка се композира с функцията идентитет, която получава един аргумент и го връща без промяна.
; Пример: 
(define (pair-compose fs)
  (if (empty? fs)
    (list)
    (cons (first (second fs)) (pair-compose (rest (rest fs))))
  )
  (apply + fs)
)

(define (add2 x)
  (+ x 2))

(define g (pair-compose (list add1 add2)))
(add2 2)
(g 1)
