#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

;##### Aufgabe 1.1 #####


(define agame
  #(0 0 0  0 0 9  0 7 0
    0 0 0  0 8 2  0 5 0
    3 2 7  0 0 0  0 4 0

    0 1 6  0 4 0  0 0 0
    0 5 0  0 0 0  3 0 0
    0 0 0  0 9 0  7 0 0

    0 0 0  6 0 0  0 0 5
    8 0 2  0 0 0  0 0 0
    0 0 4  2 0 0  0 0 8))
;> (game-consistent? agame) ;-> #t
;> (game-solved? agame)     ;-> #t


(define agame-wrong
  #(1 2 3  4 5 6  7 8 9
    9 1 2  3 4 5  6 7 8
    8 9 1  2 3 4  5 6 7

    7 8 9  1 2 3  4 5 6
    0 5 0  0 0 0  3 0 0
    0 0 0  0 9 0  7 0 0

    0 0 0  6 0 0  0 0 5
    8 0 2  0 0 0  0 0 0
    0 0 4  2 0 0  0 0 8))
;> (game-consistent? agame-wrong) ;-> #f
;> (game-solved? agame-wrong)     ;-> #f


(define agame-solved
  #(6 8 5  4 3 9  2 7 1
    4 9 1  7 8 2  6 5 3
    3 2 7  5 6 1  8 4 9

    9 1 6  3 4 7  5 8 2
    7 5 8  1 2 6  3 9 4
    2 4 3  8 9 5  7 1 6

    1 3 9  6 7 8  4 2 5
    8 6 2  9 5 4  1 3 7
    5 7 4  2 1 3  9 6 8))
;> (game-consistent? agame-solved) ;-> #t
;> (game-solved? agame-solved)     ;-> #t


(define agame-solved-wrong
  #(6 8 5  4 3 9  2 7 1
    4 9 1  7 8 2  6 5 3
    3 2 7  5 6 1  8 4 9

    9 1 6  3 4 7  5 8 2
    7 5 8  1 2 6  3 9 4
    2 4 5  8 9 5  7 1 6

    1 3 9  6 7 8  4 2 5
    8 6 2  9 5 4  1 3 7
    8 7 4  2 1 3  9 6 5))
;> (game-consistent? agame-solved-wrong) ;-> #f
;> (game-solved? agame-solved-wrong)     ;-> #f


;# 1

(define (xy->index x y)
  (+ x (* y 9)))


;# 2

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


;# 3

(define (game->entries game idx)
  (map (lambda (x)
         (vector-ref game x))
       idx))


;# 4

(define (part-consistent? part)
  (not (check-duplicates (filter positive? part))))

(define (part-solved? part)
  (and
    (part-consistent? part)
    (not (member 0 part))))

(define (game-check part-function game)
  (and
   (andmap part-function (build-list 9 (lambda (x)(game->entries game (row->idx x)))))
   (andmap part-function (build-list 9 (lambda (x)(game->entries game (column->idx x)))))
   (andmap part-function (build-list 9 (lambda (x)(game->entries game (quadr->idx x)))))))

(define (game-consistent? game)
  (game-check part-consistent? game))

(define (game-solved? game)
  (game-check part-solved? game))

