#lang racket
(define (DEGRtoRAD number)
  (degrees->radians number))
(define (RADtoDEGR number)
  (radians->degrees number))

;alpha ist winkel der funktion
(define (my-acos alpha)
  (atan (/ (sin alpha) (cos alpha))))

(define(nm->km nm)
  (* nm 1.852))
