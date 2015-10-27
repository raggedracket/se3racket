#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

;##### Aufgabe 1 - #####
(define miau 'Plueschi)
(define katze miau)
(define tiger 'miau)

(define (welcherNameGiltWo PersonA PersonB)
  (let (
        (PersonA 'Sam)
        (PersonC PersonA))
    PersonC))

(define xs1 '(0 2 3 miau katze))
(define xs2 (list miau katze))
(define xs3 (cons katze miau))

;# 1.01 miau
;
;# 1.02 katze
;
;# 1.03 tiger
;
;# 1.04 (quote katze)
;
;# 1.05 (eval tiger)
;
;# 1.06 (eval katze)
;
;# 1.07 (eval 'tiger)
;
;# 1.08 (welcherNameGiltWo 'harry 'potter)
;
;# 1.09 (cdddr xs1)
;
;# 1.10 (cdr xs2)
;
;# 1.11 (cdr xs3)
;
;# 1.12 (eval (sqrt 3))
;
;# 1.13 (eval '(welcherNameGiltWo 'tiger 'katze))
;
;# 1.13 (eval (welcherNameGiltWo 'katze 'tiger))
;

;##### Aufgabe 2 - #####

;### 2.1 ###

