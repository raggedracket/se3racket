#lang racket

;Aufgabe 1

(define (DEGRtoRAD number)
  (degrees->radians number))
(define (RADtoDEGR number)
  (radians->degrees number))

(define (sintocos cosa)
  (sqrt(- 1 (expt cosa 2))))

;alpha ist winkel der funktion
(define (my-acos cosa)
  (atan (/ (sintocos cosa) cosa)))

(define(nm->km nm)
  (* nm 1.852))

;Aufgabe 2


(define (distanzAB breiteA laengeA breiteB laengeB)
  (* 60 (RADtoDEGR(my-acos (+(*(sin(DEGRtoRAD breiteA))(sin(DEGRtoRAD breiteB)))(*(cos(DEGRtoRAD breiteA))(cos(DEGRtoRAD breiteB))(cos(-(DEGRtoRAD laengeA)(DEGRtoRAD laengeB)))))))))
;(distanzAB 59.93 10.75 22.20 114.10)
;(distanzAB 37.75 -122.45 21.32 -157.83)
;(distanzAB -27.10 -109.40 -12.10 -77.05)