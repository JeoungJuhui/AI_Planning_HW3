; Problem description
; Describe one scenario within the domain constraints
; This one describes the Tower of Hanoi with 3 discs
(define (problem red1)
  (:domain redriding)

  ; Objects are candidates to replace free variables
  (:objects red granny wolf hunter
            redhome woods grannyhome
            basket weapon flower 
            eaten full veryfull die alive sleep
            )

  ; The initial state describe what is currently true
  ; Everything else is considered false
  (:init
    ; Characters are at their initial places
    (at red redhome) (at granny grannyhome) (at wolf woods) (at hunter woods)
    
    (connect redhome woods) (connect woods grannyhome)
    
    (predator wolf)
    
    ; Red has a basket
    (have red basket) (have hunter weapon) 
  )

  ; The goal state describe what we desire to achieve
  (:goal (and

    (in basket flower)
    (not(predator wolf))
    (not(in wolf red))
    (not(in wolf granny))

  ))
)