#lang racket

;Aufgabe 1

(define (DEGRtoRAD number)
  (degrees->radians number))
(define (RADtoDEGR number)
  (radians->degrees number))

;alpha ist winkel der funktion
(define (my-acos alpha)
  (atan (/ (sin alpha) (cos alpha))))

(define(nm->km nm)
  (* nm 1.852))

;Aufgabe 2


(define (distanzAB breiteA laengeA breiteB laengeB)
  ((RADtoDEGR(+(*(sin(DEGRtoRAD breiteA))(sin(DEGRtoRAD breiteB)))(*(cos(DEGRtoRAD breiteA))(cos(DEGRtoRAD breiteB))(cos(-(DEGRtoRAD laengeA)(DEGRtoRAD laengeB))))))))