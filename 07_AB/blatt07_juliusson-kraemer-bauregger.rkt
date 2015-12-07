#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

(require 2htdp/image)
(require lang/posn)
(require 2htdp/universe)

;##### Aufgabe 1 - #####

;### Allgemein rekursive Lösung ###
(define (range tupel n)
  (if (>= (car tupel) (cdr tupel))
      '()
      (cons (car tupel) (range (cons (+ (car tupel) (/ (cdr tupel) n))  (cdr tupel)) n))
      )
  )

;### Endrekursive Lösung ###
(define (range2 tupel n [akku '()])
  (if (>= (car tupel) (cdr tupel))
      (reverse akku)
      (range2
       (cons 
        (+ (car tupel) (/ (cdr tupel) n))
        (cdr tupel)
        )
       n
       (cons (car tupel) akku))
      )
  )

;### Lösung mittels geeigneter Funktion höherer Ordnung ###
(define (range3 tupel n)
  (build-list
   n
   (lambda (x) 
     (* x (/ (cdr tupel) n))
     )
   )
  )


;##### Aufgabe 2 - #####

;### 2.1 ###
;bildet x werte aus dem interval (a.b) durch n-fache ausführung von (((b-a)* iterator)+n)
(define (x-builder interval n)
  (build-list n
              (lambda (x) (+ (car interval) (* x (/ (- (cdr interval) (car interval)) n))))))

;wendet eine Funktion auf einem Intervall an und verbindet dann x und y wert
(define (function->points f interval n)
  (map (lambda (x y) (cons x y))
       (x-builder interval n)
       (map f (x-builder interval n))))

;### 2.2 ###
;(rescale1d '( 0 2 4 6 8) '(10 . 50)) -> '(10 20 30 40 50)
;mmultipliziert jedes element der liste mit einem anpassungsfaktor, welcher aus scale und list hergeleitet wird
(define (rescale1d list scale)
  (map (lambda (x)
         (+ (car scale)
            (* x
               (/ (- (cdr scale)(car scale))
                  (- (last list) (car list))))))
       list))


;(rescale2d '(( 0 . 0) (2 . 4) (4 . 16) (6 . 36) (8 . 64)) '(10 . 50) '( 5 . 25))
;-> '((10 . 5) (20 . 27 /4 ) (30 . 10) (40 . 37 /4 ) (50 . 25))
;lop = list of pairs // wendet rescale1d auf jedes 1. (und 2.) element aus iop an, mit
;jeweils scale1 oder scale2 und verknüpft diese dann
(define (rescale2d lop scale1 scale2)
  (map (lambda (x y) (cons x y))
       (rescale1d (map car lop) scale1)
       (rescale1d (map cdr lop) scale2)
       ))


;### 2.3 ###
(define draw_width 800)
(define draw_height 600)

; Zeichnet die Liste an Punkten
; marker: hervorgehobener Punkt
; xs: Liste der Punkte
(define (draw-points marker xs)
  (place-images
   (append
    (make-list (length xs) (ellipse 2 2 "solid" "black"))
    (list (ellipse 5 5 "solid" "red")))
   (pointlist->posn (append xs (list (list-ref xs marker))))
   (empty-scene draw_width draw_height "white")))

; Wandle Punkt-Paare zu posn um
(define (pointlist->posn xs)
  (map
   (lambda (x)(make-posn (car x) (cdr x)))
   xs))


;### 2.4 ###
; Male die Funktion f im gegebenen Intervall mit n Schritten
(define (plot-function f interval n)
  (draw-points 0
               (rescale2d
                (function->points f interval n)
                '(0 . 800)
                '(330 . 250))))


;### 2.5 ###
; Male die Funktion f im gegebenen Intervall mit n Schritten.
; Markiere den t'ten Punkt des Graphen
(define (live-plot-function f interval n t)
  (draw-points (modulo t n)
               (rescale2d
                (function->points f interval n)
                '(0 . 800)
                '(330 . 250))))

; Beispiele:
;
;(live-plot-function sin '(0 . 7) 100 150)
;
;(animate (curry live-plot-function sin (cons 0 25) 150))
;(animate (curry live-plot-function sin (cons 0 7) 100))
;(animate (curry live-plot-function tan (cons 0 7) 150))
;
;f(x) = sin(x)*cos(x/2)
;(animate (curry live-plot-function (lambda (x)(* (sin x)(cos (/ x 2)))) (cons 0 37) 150))
