; Domain description
; Describe the relations and transitions that can occur
; This one describes the Tower of Hanoi puzzle
(define (domain redriding) ; Domain name must match problem's

  ; Define what the planner must support to execute this domain
  ; Only domain requirements are currently supported
  (:requirements
    :strips                 ; basic preconditions and effects
    :negative-preconditions ; to use not in preconditions
    :equality               ; to use = in preconditions
    ; :typing               ; to define type of objects and parameters
  )

  ; Define the relations
  ; Question mark prefix denotes free variables
  (:predicates
    (have ?person ?obj)    ; ?person has ?obj
    (at ?person ?loc)      ; ?person is at ?loc
  )

  ; Define a transition to move a person from one place to another
  (:action move
    :parameters (?person ?from ?to)
    ; Only conjunction or atomic preconditions are supported
    :precondition (and
      (at ?person ?from)
      (not (= ?from ?to)) ; Negative precondition and equality
    )
    ; Only conjunction or atomic effects are supported
    :effect (and
      ; Note that adding the new relations is not enough
      (at ?person ?to)
      ; Remove the old relations, order is not important
      (not (at ?person ?from))
    )
  )
  
  ; Define an action to give an object from one person to another person
  (:action give
    :parameters (?person1 ?person2 ?loc ?obj)
    ; Only conjunction or atomic preconditions are supported
    :precondition (and
      (at ?person1 ?loc)
      (at ?person2 ?loc)
      (have ?person1 ?obj)
      (not (have ?person2 ?obj)) ; Negative precondition and equality
    )
    ; Only conjunction or atomic effects are supported
    :effect (and
      ; Note that adding the new relations is not enough
      (have ?person2 ?obj)
      ; Remove the old relations, order is not important
      (not (have ?person1 ?obj))
    )
  )  
  ; Other transitions can be defined here
)