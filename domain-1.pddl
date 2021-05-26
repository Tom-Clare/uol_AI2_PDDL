;;Domain for cleaning floor tiles
;; A domain file for CMP2020M assignment 2018/2019

;; Define the name for this domain (needs to match the domain definition
;;   in the problem files)

(define (domain floor-tile)

	;; We only require some typing to make this plan faster. We can do without!
	(:requirements :typing)

	;; We have two types: robots and the tiles, both are objects
	(:types robot tile - object)

	;; define all the predicates as they are used in the probem files
	(:predicates  

    ;; described what tile a robot is at
    (robot-at ?r - robot ?x - tile)

    ;; indicates that tile ?x is above tile ?y
    (up ?x - tile ?y - tile)

    ;; indicates that tile ?x is below tile ?y
    (down ?x - tile ?y - tile)

    ;; indicates that tile ?x is right of tile ?y
    (right ?x - tile ?y - tile)

    ;; indicates that tile ?x is left of tile ?y
    (left ?x - tile ?y - tile)
    
    ;; indicates that a tile is clear (robot can move there)
    (clear ?x - tile)

    ;; indicates that a tile is cleaned
    (cleaned ?x - tile)
 	)


;; Action definitions, e.g. 


;; (:action clean-up
;;  :parameters (?r - robot ?y - tile ?x - tile)
;;  :precondition (and 
;;									(...)
;;								)
;;  :effect (and 
;;							(...) 
;;							(...)
;;					)
;; )


;; ACTIONS that need to be defined:

(:action clean-up
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and (up ?y ?x) (robot-at ?r ?x) (clear ?y) (not (cleaned ?y)))
  :effect (and (cleaned ?y))
)


(:action clean-down
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and (down ?y ?x) (robot-at ?r ?x) (clear ?y) (not (cleaned ?y)))
  :effect (and (cleaned ?y))
)


(:action up
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and (up ?y ?x) (clear ?y) (robot-at ?r ?x) (not (cleaned ?y)))
  :effect (and (clear ?x) (robot-at ?r ?y) (not (robot-at ?r ?x)) (not (clear ?y)))
)


(:action down
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and (down ?y ?x) (clear ?y) (robot-at ?r ?x) (not (cleaned ?y)))
  :effect (and (clear ?x) (robot-at ?r ?y) (not (robot-at ?r ?x)) (not (clear ?y)))
)

(:action right
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and (right ?y ?x) (clear ?y) (robot-at ?r ?x) (not (cleaned ?y)))
  :effect (and (clear ?x) (robot-at ?r ?y) (not (robot-at ?r ?x)) (not (clear ?y)))
)

(:action left
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and (left ?y ?x) (clear ?y) (robot-at ?r ?x) (not (cleaned ?y)))
  :effect (and (clear ?x) (robot-at ?r ?y) (not (robot-at ?r ?x)) (not (clear ?y)))
)



)
