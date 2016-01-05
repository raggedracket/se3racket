#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther (require "setkarten-module.rkt")

(require "setkarten-module.rkt")

;##### Aufgabe 1 - #####

;### 1.1 ###
;Eine Funktion höherer ordnung ist eine Funktion die (1.) mindestens eine Funktion als
;Argument übernimmt oder (2.) Funktionen Ausgeben

;### 1.2 ###
; wir verweisen auf 1. und 2. aus 1.1
;a) foldl wird eine Funktion übergebn also gilt (1.)
;b) die Funktion gibt die Funktion car oder cdr aus, also gilt (2.)
;c) pepper übernimmt eine Funktion f, also gilt (1.)
;d) diese Funktion arbeitet zwar auf Funktionen, gibt aber weder neue aus, noch übernimmt sie
;welche. Es gilt also weder (1.) noch (2.) und somit ist sie keine Funktion höherer Ordnung

;### 1.3 ###
(define (pepper f arg1 )
  (lambda (arg2 )
    (f arg1 arg2)))

;### 1.4 ###
;(foldl (curry / 2) 1 '( 1 1 2 3 )) -> 2/3
; Die Procedure (/ 2 X) wird einmal auf jedes Element angewandt, von links nach rechts, somit
; wird (/ 2 3) als ergebnis geliefert

; (map cons '(1 2 3 4) '(1 2 3 4)) -> '((1 . 1) (2 . 2) (3 . 3) (4 . 4))
; map wendet Cons immer auf das Nte Element aus x1 und x2 an (also immer die beiden ersten und
; Elemente dann die beiden zweiten Elemente usw...)

; (filter pair? '((a b) () 1 (()))) -> '((a b) (()))
; filter pair? sucht aus der gegebenen Liste alle Paare heraus (a b) ist ein Paar, 1 sowie die
; Leere Klammer sind keine Listen, nun interpretiert Racket die merfachklammerung vermutlich
; als leere Liste

; (map (compose (curry + 32) (curry * 1.8)) '(5505 100 0 1 1000 -273.15)) ->
; '(9941.0 212.0 32 33.8 1832.0 -459.66999999999996)
; map wendet die Funktion (compose (curry + 32) (curry * 1.8)) auf jedes Element der Liste an
; das Heißt es wird erst 32 auf das Element Addiert und dann mit 1.8 multipliziert

;### 1.5 ###
; Die Funktion Wandelt von Celsius zu Farenheit um die Umkerfunktion Lautet 
(define (f-to-c xs)
  (map (compose (curry + (- 32)) (curry * (/ 5 9))) xs))

;##### Aufgabe 2 - #####

;### 2.1 ###
(define (mass-sqrt xs)
  (map sqrt xs))

;### 2.2 ###
(require htdp/error)
(define (nteilbar n xs)
  (map (curry * 3)
       (filter natural?
               (map (curryr / n) xs)
               )
       ))
;(nteilbar 3 '(1 3 6 8 9 12 13 16))

;### 2.3 ###
(define (summenfunktion xs)
  (foldl + 0 (filter (curry < 10)(filter odd? xs))))



;##### Aufgabe 3   #####

; Lists of possible features
(define pattern (list 'oval 'rectangle 'waves))
(define color (list 'red 'green 'blue))
(define quantitys (list 'one 'two 'three))
(define mode (list 'outline 'hatched 'solid))

; build function
(define (make-setcard pattern color quantity mode)(list pattern color quantity mode))

; get functions
(define (get-pattern card)(first color))
(define (get-color card)(second color))
(define (get-quantity card)(third color))
(define (get-mode card)(fourth color))

; generate all possible list indices
(define (gen-combinations)
  (build-list 81 (lambda (x)(list (modulo x 3)
                                  (floor (/ (modulo x 9)  3))
                                  (floor (/ (modulo x 27) 9))
                                  (floor (/ (modulo x 81) 27))))))
; generate the cards
(define (gen-cards)
  (map
    (lambda (xs)
      (make-setcard
        (list-ref pattern (first xs))
        (list-ref color (second xs))
        (+ 1 (third xs))
        (list-ref mode (fourth xs))))
    (gen-combinations)))

; map generated cards to draw function
(define (draw-cards xs_cards)
  (map
    (lambda (xs)
      (show-set-card (third xs)
                     (first xs)
                     (fourth xs)
                     (second xs)))
    (gen-cards)))