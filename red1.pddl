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
    (connect woods redhome) (connect grannyhome woods)
    
    (predator wolf)
    (predator-alive)
    

    ; Red has a basket
    (have red basket) (have hunter weapon) 
  )

  ; The goal state describe what we desire to achieve
  (:goal (and
    ; Discs stacked on peg3
    ;(have granny basket)
    ;(state wolf full)
    (state granny alive)
    (have red flower)
  ))
)