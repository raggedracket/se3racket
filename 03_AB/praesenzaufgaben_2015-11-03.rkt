#lang racket

(define (anzahl xs element)
  (cond
    [(empty? xs) 0]
    [(equal? (car xs) element) (+ 1 (anzahl (cdr xs) element))]
    [(anzahl (cdr xs) element)]))

(define (translate element xs)
    (cond
      [(empty? xs) 'NotDefined]
      [(equal? (caar xs) element) (cdar xs)]
      [(translate element (cdr xs))]
))

;#(assoc )