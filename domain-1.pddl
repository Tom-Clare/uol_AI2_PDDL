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


  ;; Clean the tile above the robot
(:action clean-up
  ;; parameters:
         ;; ?r = robot that does the cleaning
         ;; ?y = target tile
         ;; ?x = current tile
  :parameters (?r - robot ?y - tile ?x - tile)
  ;; preconditions:
         ;; check that target (?y) is above current (?x)
         ;; robot (?r) is at current (?x)
         ;; target (?y) is clear of other robots
         ;; target (?y) has not been cleaned already, as we should only clean each tile once
  :precondition (and (up ?y ?x) (robot-at ?r ?x) (clear ?y) (not (cleaned ?y)))
  ;; effects:
         ;; target (?y) is cleaned
  :effect (and (cleaned ?y))
)


(:action clean-down
  ;; parameters:
         ;; ?r = robot that does the cleaning
         ;; ?y = target tile
         ;; ?x = current tile
  :parameters (?r - robot ?y - tile ?x - tile)
  ;; preconditions:
         ;; target (?y) is below current (?x)
         ;; robot (?r) is at current (?x)
         ;; target (?y) is clear of other robots
         ;; target (?y) has not been cleaned already, as we should only clean each tile once
  :precondition (and (down ?y ?x) (robot-at ?r ?x) (clear ?y) (not (cleaned ?y)))
  ;; effects:
         ;; target (?y) is cleaned
  :effect (and (cleaned ?y))
)


(:action up
  ;; parameters:
         ;; ?r = robot that does the cleaning
         ;; ?y = target tile
         ;; ?x = current tile
  :parameters (?r - robot ?y - tile ?x - tile)
  ;; preconditions:
         ;; target (?y) is above current (?x)
         ;; target (?y) is clear of other robots
         ;; robot (?r) is at current (?x)
         ;; target (?y) has not been cleaned, as robots cannot drive on wet surfaces
  :precondition (and (up ?y ?x) (clear ?y) (robot-at ?r ?x) (not (cleaned ?y)))
  ;; effects:
         ;; current (?x) is clear
         ;; robot (?r) is at target (?y)
         ;; robot (?r) is not at current (?x)
         ;; target (?y) is not clear because that is where the robot has moved to
  :effect (and (clear ?x) (robot-at ?r ?y) (not (robot-at ?r ?x)) (not (clear ?y)))
)


(:action down
  ;; parameters:
         ;; ?r = robot that does the cleaning
         ;; ?y = target tile
         ;; ?x = current tile
  :parameters (?r - robot ?y - tile ?x - tile)
  ;; preconditions:
         ;; target (?y) is below current (?x)
         ;; target (?y) is clear of other robots
         ;; robot (?r) is at current (?x)
         ;; target (?y) has not been cleaned, as robots cannot drive on wet surfaces
  :precondition (and (down ?y ?x) (clear ?y) (robot-at ?r ?x) (not (cleaned ?y)))
  ;; effects:
         ;; current (?x) is clear
         ;; robot (?r) is at target (?y)
         ;; robot (?r) is no longer at current (?x)
         ;; target (?y) is not clear because that is where the robot has moved to
  :effect (and (clear ?x) (robot-at ?r ?y) (not (robot-at ?r ?x)) (not (clear ?y)))
)

(:action right
  ;; parameters:
         ;; ?r = robot that does the cleaning
         ;; ?y = target tile
         ;; ?x = current tile
  :parameters (?r - robot ?y - tile ?x - tile)
  ;; preconditions:
         ;; target (?y) is right of current (?x)
         ;; target (?y) is clear of other robots
         ;; robot (?r) is at current (?x)
         ;; target (?y) has not been cleaned, as robots cannot drive on wet surfaces
  :precondition (and (right ?y ?x) (clear ?y) (robot-at ?r ?x) (not (cleaned ?y)))
  ;; effects:
         ;; current (?x) is clear
         ;; robot (?r) is at target (?y)
         ;; robot (?r) is no longer at current (?x)
         ;; target (?y) is not clear because that is where the robot has moved to
  :effect (and (clear ?x) (robot-at ?r ?y) (not (robot-at ?r ?x)) (not (clear ?y)))
)

(:action left
  ;; parameters:
         ;; ?r = robot that does the cleaning
         ;; ?y = target tile
         ;; ?x = current tile
  :parameters (?r - robot ?y - tile ?x - tile)
  ;; preconditions:
         ;; target (?y) is left of current (?x)
         ;; target (?y) is clear of other robots
         ;; robot (?r) is at current (?x)
         ;; target (?y) has not been cleaned, as robots cannot drive on wet surfaces
  :precondition (and (left ?y ?x) (clear ?y) (robot-at ?r ?x) (not (cleaned ?y)))
  ;; effects:
         ;; current (?x) is clear
         ;; robot (?r) is at target (?y)
         ;; robot (?r) is no longer at current (?x)
         ;; target (?y) is not clear because that is where the robot has moved to
  :effect (and (clear ?x) (robot-at ?r ?y) (not (robot-at ?r ?x)) (not (clear ?y)))

)

)

;; Luhne, P. (2017) GitHub Repository. Available from https://github.com/potassco/pddl-instances/blob/master/ipc-2014/domains/floor-tile-sequential-agile/domain.pddl [accessed 25 May 2021].
;; Yu, M. (2021) PDDL for planning I [lecture]. Artificial Intelligence CMP2020M, University of Lincoln, 30 April. Available from https://blackboard.lincoln.ac.uk/webapps/blackboard/content/listContent.jsp?course_id=_146492_1&content_id=_4088456_1 [accessed 25 May 2021].