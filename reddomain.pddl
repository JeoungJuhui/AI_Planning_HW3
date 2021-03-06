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
        (predator ?person)
        (plant ?obj)
        (weapon ?obj)
        (sleep ?person)
        (know ?person ?info)
        (in ?obj1 ?obj2)
        (meet ?person1 ?person2)
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
        :parameters (?person1 ?person2 ?obj ?obj2)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (meet ?person1 ?person2)
          (not(predator-alive))
          (have ?person1 ?obj)
          (in ?obj ?obj2)
          (not (have ?person2 ?obj)) ; Negative precondition and equality
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (have ?person2 ?obj)
          ; Remove the old relations, order is not important
          (not (have ?person1 ?obj))
          (not (meet ?person1 ?person2))

        )
    )  
    ; Other transitions can be defined here
    
    (:action meet
        :parameters (?person1 ?person2 ?loc)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (at ?person1 ?loc)
          (at ?person2 ?loc)
          (not(= ?person1 ?person2))
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (meet ?person1 ?person2)
        )
    )  
    
    ; Define an action to give an object from one person to another person
    (:action eat-alive
        :parameters (?person1 ?person2)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (predator ?person1)
          (meet ?person1 ?person2)
          (not(plant ?person2))
          (not(in ?person1 ?person2))
          (not(= ?person1 ?person2))
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (in ?person1 ?person2)
          (not (meet ?person1 ?person2))
        )
    )  
    ; Other transitions can be defined here
    
    
    ; Define an action to give an object from one person to another person
    (:action sleep
        :parameters (?person1 ?person2 ?person3)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (predator ?person1)
          (in ?person1 ?person2)
          (in ?person1 ?person3)
          (not(= ?person2 ?person3))
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (sleep ?person1)
        )
    )  
    ; Other transitions can be defined here
    
    (:action kill
        :parameters (?person1 ?person2 ?obj)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (meet ?person1 ?person2)
          (sleep ?person1)
          (predator ?person1)
          (weapon ?obj)
          (have ?person2 ?obj)
          (not(= ?person1 ?person2))
          (not(in ?person1 ?person2))
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (not(predator ?person1))
          (not (meet ?person1 ?person2))
          (not(predator-alive))
        )
    )  
    ; Other transitions can be defined here
    
    (:action save
        :parameters (?person1 ?person2 ?person3 ?weapon)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (not(predator ?person1))
          (in ?person1 ?person2)
          (not(in ?person1 ?person3))
          (not(= ?person1 ?person2))
          (not(= ?person3 ?person2))
          (have ?person3 ?weapon)
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (not (in ?person1 ?person2))
        )
    )  
    ; Other transitions can be defined here
    
    (:action tell
        :parameters (?person1 ?person2 ?info ?obj)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (meet ?person1 ?person2)
          (have ?person2 ?obj)
          (not(= ?person1 ?person2))
          (not(in ?person1 ?person2))
          (predator ?person1)
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (know ?person2 ?info)
          (not (meet ?person1 ?person2))
        )
    )  
    ; Other transitions can be defined here
    
    (:action pick-flowers
        :parameters (?person1 ?info ?obj ?loc)
        ; Only conjunction or atomic preconditions are supported
        :precondition (and
          (know ?person1 ?info)
          (at ?info ?loc)
          (at ?person1 ?loc)
          (have ?person1 ?obj)
        )
        ; Only conjunction or atomic effects are supported
        :effect (and
          ; Note that adding the new relations is not enough
          (in ?obj ?info)
        )
    )  
    ; Other transitions can be defined here
    
)