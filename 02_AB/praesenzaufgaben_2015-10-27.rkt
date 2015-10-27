#lang racket

;(laenge '(1 2 3 4 4)) -> 5

(define (laenge xs)
  (if (equal? '() xs)
      0
      (+ 1 (laenge (cdr xs)))))