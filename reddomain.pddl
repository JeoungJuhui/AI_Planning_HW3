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
        (connect ?loc1 ?loc2)
        (meet ?pc1 ?pc2)
        (predator ?person)
        (state ?pc ?state)
        (know ?person ?info)
        (predator-alive)
    )
    
    ; Define a transition to move a person from one place to another
    (:action move
        :parameters (?person ?from ?to)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (at ?person ?from)
          (not (= ?from ?to)) ; Negative precondition and equality
          (connect ?from ?to)
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
    
    ; Define an action to give an object from one person to another person
    (:action eat-alive
        :parameters (?person1 ?person2 ?loc)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (predator ?person1)
          (not(state ?person1 full))
          (not(= ?person1 ?person2))
          (at ?person1 ?loc)
          (at ?person2 ?loc)
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (state ?person1 full)
          (state ?person2 eaten)
        )
    )  
    ; Other transitions can be defined here
    
    ; Define an action to give an object from one person to another person
    (:action sleep
        :parameters (?person ?loc)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (at ?person ?loc)
          (state ?person full)
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (state ?person sleep)
        )
    )  
    ; Other transitions can be defined here
    
    (:action kill
        :parameters (?person1 ?person2 ?loc ?weapon)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (at ?person1 ?loc)
          (at ?person2 ?loc)
          (state ?person1 sleep)
          (predator ?person1)
          (have ?person2 ?weapon)
          (not(= ?person1 ?person2))
          (not(state ?person2 eaten))
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (state ?person1 die)
          (not(predator-alive))

        )
    )  
    ; Other transitions can be defined here
    
    (:action save
        :parameters (?person1 ?person2 ?loc)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (at ?person1 ?loc)
          (at ?person2 ?loc)
          (state ?person2 eaten)
          (not(predator-alive))

          (not(predator ?person1))
          (not(= ?person1 ?person2))
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (state ?person2 alive)
        )
    )  
    ; Other transitions can be defined here
    
    (:action tell
        :parameters (?person1 ?person2 ?loc ?info)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (at ?person1 ?loc)
          (at ?person2 ?loc)
          (have ?person2 basket)
          (not(= ?person1 ?person2))
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (know ?person2 ?info)
        )
    )  
    ; Other transitions can be defined here
    
    (:action pick-flowers
        :parameters (?person1 ?loc ?info)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (at ?person1 ?loc)
          (know ?person1 ?info)
          (not(have ?person1 ?info))
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (have ?person1 ?info)
        )
    )  
    ; Other transitions can be defined here
)