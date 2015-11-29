#lang racket
(require 2htdp/image)
(require lang/posn)

;Erschafft kleine Koch-Schneeflöckchen 
(define (koch-schneeflocke)
  (above
   (beside
    (rotate 60 (koch-curve 3))
    (rotate 300 (koch-curve 3)))
   (rotate 180 (koch-curve 3))))

;Erschafft rekursiv durch viele kleine quadrate eine Koch Kurve
(define (koch-curve n)
  (cond
    [(zero? n) (square 1 "solid" "black")]
    [else
     (beside/align "bottom"
                   (koch-curve (- n 1))
                   (rotate 60 (koch-curve (- n 1)))
                   (rotate -60 (koch-curve (- n 1)))
                   (koch-curve (- n 1)))]))
;Erschafft n zufällig verteilte Schneflocken auf einen von n abhängigen Raum
(define (schneeflocken n)
  (place-images/align
   (make-list n (koch-schneeflocke))
   (make-list n (make-posn (random(* 50 n)) (random(* 50 n))))
   ; das kackding generiert eine Random number und packt sie n mal in eine liste und ich finde nicht heraus wie man n mal random numbers generated
   "right"
   "bottom"
   (rectangle (* 100 n) (* 100 n) "solid" "LightCyan") ))
