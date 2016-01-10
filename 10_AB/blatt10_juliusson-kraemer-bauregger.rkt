#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

;##### Aufgabe 1 #####

(define game #(0 0 0 0 0 9 0 7 0
               0 0 0 0 8 2 0 5 0
               3 2 7 0 0 0 0 4 0
               0 1 6 0 4 0 0 0 0
               0 5 0 0 0 0 3 0 0
               0 0 0 0 9 0 7 0 0
               0 0 0 6 0 0 0 0 5
               8 0 2 0 0 0 0 0 0
               0 0 4 2 0 0 0 0 8))

(define (xy->index x y)
  (+ x (* y 9)))

(define (row->idx row)
  (build-list 9 (lambda (x)
                  (xy->index x row))))

(define (column->idx col)
  (build-list 9 (lambda (x)
                  (xy->index col x))))

(define (quadr->idx quadr)
  (build-list 9 (lambda (x)
                  (xy->index
                   (+ (modulo (* quadr 3) 9)
                      (modulo x 3))
                   (+ (floor (/ x 3))
                      (* 3 (floor (/ quadr 3))))))))

(define (game->entries game idx)
  (map (lambda (x)
         (vector-ref game x))
       idx))

(define (part-consistent? part)
  (not (check-duplicates (filter positive? part))))

(define (game-consistent? game)
  (and
   (andmap part-consistent? (build-list 9 (lambda (x)(game->entries game (row->idx x)))))
   (andmap part-consistent? (build-list 9 (lambda (x)(game->entries game (column->idx x)))))
   (andmap part-consistent? (build-list 9 (lambda (x)(game->entries game (quadr->idx x)))))))

;(define (game-solved? game))
