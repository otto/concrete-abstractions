;;Use Pretty Big Custom in Dr Racket with some slight modifications
;;https://gustavus.edu/+max/concabs/schemes/drscheme/

(require (lib "fungraph.ss" "concabs"))

;;ex 1.1
(* 3 4)
;; 12

(* (+ 5 3) (- 5 3))
;; 16

(/ (+ (* (- 17 14) 5) 6) 7)
;; 3

;; ex 1.2.a
(define tax
  (lambda (x)
    (+ x (* 5/100 x))))

;; ex 1.2.b
;; 1.3545
;; 2.52

;; ex 1.3.a
;; no
;; 1.3.b
(define f (lambda (x) (* x x)))
(define square f)

(f 7)
;; 49

(square 7)
;; 49

(define f (lambda (x) (+ x 2)))
(f 7)
;; 9

(square 7)
;; 49


;; ex 1.4.a
(define candy-temperature
(lambda (temperature elevation)
(- temperature (/ elevation 500))))

;; ex 1.4.b
(define candy-temperature
(lambda (temperature elevation)
(- temperature (round (/ elevation 500)))))


;; exercise 1.5
(define tax
  (lambda (x)
    (if (<= x 10000)
        0
        (* 20/100 (- x 10000)))))

;; ex 1.6
(define turkey-servings
  (lambda (weight)
    (round (/ weight
              (if (> weight 12)
                  1/2
                  3/4)))))

;; ex 1.7a
;; Adds a to the larger of b or c

;; ex 1.7b
;; Absolute value of x

(include "./quilting.scm")

;; ex 1.8
;; stack seems to stack quilt objects
;; quarter-turn turns a quilt object to the right by 90 deg

;; ex 1.9
(define half-turn
  (lambda (quilt)
    (quarter-turn-right (quarter-turn-right quilt))))

(define quarter-turn-left
  (lambda (quilt)
    (half-turn (quarter-turn-right quilt))))

;; ex 1.9b
(define side-by-side
  (lambda (l r)
    (quarter-turn-left (stack
            (quarter-turn-right l)
            (quarter-turn-right r)))))

;; ex 1.10
(define pinwheel
  (lambda (image)
    (stack
     (side-by-side (quarter-turn-right image) (half-turn image))
     (side-by-side image (quarter-turn-left image)))))


;; ex 1.11a

;; ex 1.11b
(define skinny-diamond
  (overlay (overlay
            (filled-triangle 0 1 0 0 -1/2 0)
            (filled-triangle 0 1 0 0 1/2 0))
           (overlay
            (filled-triangle 0 -1 0 0 1/2 0)
            (filled-triangle 0 -1 0 0 -1/2 0))))

(pinwheel skinny-diamond)

;; ex 1.12 x=1 y=16
;; ex 1.13 (+ (* 9 9 2) 9 2)
;; ex 1.14
(define avg
  (lambda (x y)
    (/ (+ x y) 2)))

;; ex 1.15 Anything that stops when y==0 (= y 0) (>= y 0) (<= y 0)


;; ex 1.16
;;(define ladder-height
;;  (lambda (ladder-length base-distance)
;;    (sqrt (- (square ladder-length)
;;             (square base-distance)))))

;; (ladder-height 10 6)

;; (sqrt (- (square 10)
;;          (square 6)))

;; (sqrt (- (100)
;;          (36)))

;; (sqrt 64)

;; 8
