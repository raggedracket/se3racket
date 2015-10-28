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
;'Plueschi
;
;# 1.02 katze
;'plueschi
;
;# 1.03 tiger
;'miau
;
;# 1.04 (quote katze)
;'katze
;
;# 1.05 (eval tiger)
;'Plueschi
;
;# 1.06 (eval katze)
; Error Plueschi: undefined
;
;# 1.07 (eval 'tiger)
;’miau
;
;# 1.08 (welcherNameGiltWo 'harry 'potter)
;'harry
;
;# 1.09 (cdddr xs1)
;'(miau katze)
;
;# 1.10 (cdr xs2)
;'(Plueschi)
;
;# 1.11 (cdr xs3)
;'Plueschi
;
;# 1.12 (eval (sqrt 3))
;1.7320508075688772
;
;# 1.13 (eval '(welcherNameGiltWo 'tiger 'katze))
;'tiger
;
;# 1.13 (eval (welcherNameGiltWo 'katze 'tiger))
;’Plueschi
;

;##### Aufgabe 2 - #####

;### 2.1 ###

