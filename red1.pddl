; Problem description
; Describe one scenario within the domain constraints
; This one describes the Tower of Hanoi with 3 discs
(define (problem red1)
  (:domain redriding)

  ; Objects are candidates to replace free variables
  (:objects red granny wolf hunter
            redhome woods grannyhome
            basket weapon flower 
            sleep
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

    (not(predator wolf))
    (not(in wolf red))
    (not(in wolf granny))
    (not(in wolf hunter))
    (in basket flower)
    (have(hunter weapon))
    ;(have(granny basket))
    (at(wolf grannyhome))
    (at(red grannyhome))
    (at(hunter grannyhome))
    (at(granny grannyhome))

  ))
)