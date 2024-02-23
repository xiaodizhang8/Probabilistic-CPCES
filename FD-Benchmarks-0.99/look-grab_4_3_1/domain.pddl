(define (domain look-grab)

   (:requirements :strips)
   (:types object position)
   (:constants  
        		 o1		 o2		 o3 - object
        p1-1 p1-2 p1-3 p1-4 p2-1 p2-2 p2-3 p2-4 p3-1 p3-2 p3-3 p3-4 p4-1 p4-2 p4-3 p4-4  - position
   ) 
   (:predicates (adj ?i - position ?j - position) (located ?i - position) (holding ?o - object) (obj-at ?o - object ?i - position) (handempty))
   (:action move
      :parameters (?i - position ?j - position)
      :precondition (and (adj ?i ?j) (located ?i))
      :effect (and (not (located ?i)) (located ?j)))

   (:action pickup-1-1-look-1
		:parameters ()
		:precondition (located p1-1)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p1-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-1))))
			 (when (and (handempty) (obj-at o1 p1-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-2))))
			 (when (and (handempty) (obj-at o1 p2-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-1))))
			 (when (and (handempty) (obj-at o1 p2-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-2))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p1-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-1))))
			 (when (and (handempty) (obj-at o2 p1-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-2))))
			 (when (and (handempty) (obj-at o2 p2-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-1))))
			 (when (and (handempty) (obj-at o2 p2-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-2))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p1-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-1))))
			 (when (and (handempty) (obj-at o3 p1-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-2))))
			 (when (and (handempty) (obj-at o3 p2-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-1))))
			 (when (and (handempty) (obj-at o3 p2-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-2))))
		)
)
(:action pickup-1-2-look-1
		:parameters ()
		:precondition (located p1-2)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p1-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-1))))
			 (when (and (handempty) (obj-at o1 p1-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-2))))
			 (when (and (handempty) (obj-at o1 p1-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-3))))
			 (when (and (handempty) (obj-at o1 p2-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-1))))
			 (when (and (handempty) (obj-at o1 p2-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-2))))
			 (when (and (handempty) (obj-at o1 p2-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-3))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p1-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-1))))
			 (when (and (handempty) (obj-at o2 p1-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-2))))
			 (when (and (handempty) (obj-at o2 p1-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-3))))
			 (when (and (handempty) (obj-at o2 p2-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-1))))
			 (when (and (handempty) (obj-at o2 p2-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-2))))
			 (when (and (handempty) (obj-at o2 p2-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-3))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p1-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-1))))
			 (when (and (handempty) (obj-at o3 p1-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-2))))
			 (when (and (handempty) (obj-at o3 p1-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-3))))
			 (when (and (handempty) (obj-at o3 p2-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-1))))
			 (when (and (handempty) (obj-at o3 p2-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-2))))
			 (when (and (handempty) (obj-at o3 p2-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-3))))
		)
)
(:action pickup-1-3-look-1
		:parameters ()
		:precondition (located p1-3)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p1-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-2))))
			 (when (and (handempty) (obj-at o1 p1-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-3))))
			 (when (and (handempty) (obj-at o1 p1-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-4))))
			 (when (and (handempty) (obj-at o1 p2-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-2))))
			 (when (and (handempty) (obj-at o1 p2-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-3))))
			 (when (and (handempty) (obj-at o1 p2-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-4))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p1-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-2))))
			 (when (and (handempty) (obj-at o2 p1-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-3))))
			 (when (and (handempty) (obj-at o2 p1-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-4))))
			 (when (and (handempty) (obj-at o2 p2-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-2))))
			 (when (and (handempty) (obj-at o2 p2-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-3))))
			 (when (and (handempty) (obj-at o2 p2-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-4))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p1-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-2))))
			 (when (and (handempty) (obj-at o3 p1-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-3))))
			 (when (and (handempty) (obj-at o3 p1-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-4))))
			 (when (and (handempty) (obj-at o3 p2-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-2))))
			 (when (and (handempty) (obj-at o3 p2-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-3))))
			 (when (and (handempty) (obj-at o3 p2-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-4))))
		)
)
(:action pickup-1-4-look-1
		:parameters ()
		:precondition (located p1-4)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p1-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-3))))
			 (when (and (handempty) (obj-at o1 p1-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-4))))
			 (when (and (handempty) (obj-at o1 p2-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-3))))
			 (when (and (handempty) (obj-at o1 p2-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-4))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p1-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-3))))
			 (when (and (handempty) (obj-at o2 p1-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-4))))
			 (when (and (handempty) (obj-at o2 p2-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-3))))
			 (when (and (handempty) (obj-at o2 p2-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-4))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p1-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-3))))
			 (when (and (handempty) (obj-at o3 p1-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-4))))
			 (when (and (handempty) (obj-at o3 p2-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-3))))
			 (when (and (handempty) (obj-at o3 p2-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-4))))
		)
)
(:action pickup-2-1-look-1
		:parameters ()
		:precondition (located p2-1)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p1-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-1))))
			 (when (and (handempty) (obj-at o1 p1-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-2))))
			 (when (and (handempty) (obj-at o1 p2-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-1))))
			 (when (and (handempty) (obj-at o1 p2-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-2))))
			 (when (and (handempty) (obj-at o1 p3-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-1))))
			 (when (and (handempty) (obj-at o1 p3-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-2))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p1-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-1))))
			 (when (and (handempty) (obj-at o2 p1-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-2))))
			 (when (and (handempty) (obj-at o2 p2-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-1))))
			 (when (and (handempty) (obj-at o2 p2-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-2))))
			 (when (and (handempty) (obj-at o2 p3-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-1))))
			 (when (and (handempty) (obj-at o2 p3-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-2))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p1-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-1))))
			 (when (and (handempty) (obj-at o3 p1-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-2))))
			 (when (and (handempty) (obj-at o3 p2-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-1))))
			 (when (and (handempty) (obj-at o3 p2-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-2))))
			 (when (and (handempty) (obj-at o3 p3-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-1))))
			 (when (and (handempty) (obj-at o3 p3-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-2))))
		)
)
(:action pickup-2-2-look-1
		:parameters ()
		:precondition (located p2-2)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p1-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-1))))
			 (when (and (handempty) (obj-at o1 p1-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-2))))
			 (when (and (handempty) (obj-at o1 p1-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-3))))
			 (when (and (handempty) (obj-at o1 p2-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-1))))
			 (when (and (handempty) (obj-at o1 p2-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-2))))
			 (when (and (handempty) (obj-at o1 p2-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-3))))
			 (when (and (handempty) (obj-at o1 p3-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-1))))
			 (when (and (handempty) (obj-at o1 p3-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-2))))
			 (when (and (handempty) (obj-at o1 p3-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-3))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p1-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-1))))
			 (when (and (handempty) (obj-at o2 p1-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-2))))
			 (when (and (handempty) (obj-at o2 p1-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-3))))
			 (when (and (handempty) (obj-at o2 p2-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-1))))
			 (when (and (handempty) (obj-at o2 p2-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-2))))
			 (when (and (handempty) (obj-at o2 p2-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-3))))
			 (when (and (handempty) (obj-at o2 p3-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-1))))
			 (when (and (handempty) (obj-at o2 p3-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-2))))
			 (when (and (handempty) (obj-at o2 p3-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-3))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p1-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-1))))
			 (when (and (handempty) (obj-at o3 p1-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-2))))
			 (when (and (handempty) (obj-at o3 p1-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-3))))
			 (when (and (handempty) (obj-at o3 p2-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-1))))
			 (when (and (handempty) (obj-at o3 p2-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-2))))
			 (when (and (handempty) (obj-at o3 p2-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-3))))
			 (when (and (handempty) (obj-at o3 p3-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-1))))
			 (when (and (handempty) (obj-at o3 p3-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-2))))
			 (when (and (handempty) (obj-at o3 p3-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-3))))
		)
)
(:action pickup-2-3-look-1
		:parameters ()
		:precondition (located p2-3)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p1-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-2))))
			 (when (and (handempty) (obj-at o1 p1-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-3))))
			 (when (and (handempty) (obj-at o1 p1-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-4))))
			 (when (and (handempty) (obj-at o1 p2-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-2))))
			 (when (and (handempty) (obj-at o1 p2-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-3))))
			 (when (and (handempty) (obj-at o1 p2-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-4))))
			 (when (and (handempty) (obj-at o1 p3-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-2))))
			 (when (and (handempty) (obj-at o1 p3-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-3))))
			 (when (and (handempty) (obj-at o1 p3-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-4))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p1-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-2))))
			 (when (and (handempty) (obj-at o2 p1-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-3))))
			 (when (and (handempty) (obj-at o2 p1-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-4))))
			 (when (and (handempty) (obj-at o2 p2-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-2))))
			 (when (and (handempty) (obj-at o2 p2-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-3))))
			 (when (and (handempty) (obj-at o2 p2-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-4))))
			 (when (and (handempty) (obj-at o2 p3-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-2))))
			 (when (and (handempty) (obj-at o2 p3-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-3))))
			 (when (and (handempty) (obj-at o2 p3-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-4))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p1-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-2))))
			 (when (and (handempty) (obj-at o3 p1-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-3))))
			 (when (and (handempty) (obj-at o3 p1-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-4))))
			 (when (and (handempty) (obj-at o3 p2-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-2))))
			 (when (and (handempty) (obj-at o3 p2-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-3))))
			 (when (and (handempty) (obj-at o3 p2-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-4))))
			 (when (and (handempty) (obj-at o3 p3-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-2))))
			 (when (and (handempty) (obj-at o3 p3-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-3))))
			 (when (and (handempty) (obj-at o3 p3-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-4))))
		)
)
(:action pickup-2-4-look-1
		:parameters ()
		:precondition (located p2-4)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p1-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-3))))
			 (when (and (handempty) (obj-at o1 p1-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p1-4))))
			 (when (and (handempty) (obj-at o1 p2-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-3))))
			 (when (and (handempty) (obj-at o1 p2-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-4))))
			 (when (and (handempty) (obj-at o1 p3-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-3))))
			 (when (and (handempty) (obj-at o1 p3-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-4))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p1-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-3))))
			 (when (and (handempty) (obj-at o2 p1-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p1-4))))
			 (when (and (handempty) (obj-at o2 p2-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-3))))
			 (when (and (handempty) (obj-at o2 p2-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-4))))
			 (when (and (handempty) (obj-at o2 p3-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-3))))
			 (when (and (handempty) (obj-at o2 p3-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-4))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p1-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-3))))
			 (when (and (handempty) (obj-at o3 p1-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p1-4))))
			 (when (and (handempty) (obj-at o3 p2-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-3))))
			 (when (and (handempty) (obj-at o3 p2-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-4))))
			 (when (and (handempty) (obj-at o3 p3-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-3))))
			 (when (and (handempty) (obj-at o3 p3-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-4))))
		)
)
(:action pickup-3-1-look-1
		:parameters ()
		:precondition (located p3-1)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p2-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-1))))
			 (when (and (handempty) (obj-at o1 p2-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-2))))
			 (when (and (handempty) (obj-at o1 p3-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-1))))
			 (when (and (handempty) (obj-at o1 p3-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-2))))
			 (when (and (handempty) (obj-at o1 p4-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-1))))
			 (when (and (handempty) (obj-at o1 p4-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-2))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p2-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-1))))
			 (when (and (handempty) (obj-at o2 p2-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-2))))
			 (when (and (handempty) (obj-at o2 p3-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-1))))
			 (when (and (handempty) (obj-at o2 p3-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-2))))
			 (when (and (handempty) (obj-at o2 p4-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-1))))
			 (when (and (handempty) (obj-at o2 p4-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-2))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p2-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-1))))
			 (when (and (handempty) (obj-at o3 p2-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-2))))
			 (when (and (handempty) (obj-at o3 p3-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-1))))
			 (when (and (handempty) (obj-at o3 p3-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-2))))
			 (when (and (handempty) (obj-at o3 p4-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-1))))
			 (when (and (handempty) (obj-at o3 p4-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-2))))
		)
)
(:action pickup-3-2-look-1
		:parameters ()
		:precondition (located p3-2)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p2-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-1))))
			 (when (and (handempty) (obj-at o1 p2-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-2))))
			 (when (and (handempty) (obj-at o1 p2-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-3))))
			 (when (and (handempty) (obj-at o1 p3-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-1))))
			 (when (and (handempty) (obj-at o1 p3-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-2))))
			 (when (and (handempty) (obj-at o1 p3-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-3))))
			 (when (and (handempty) (obj-at o1 p4-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-1))))
			 (when (and (handempty) (obj-at o1 p4-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-2))))
			 (when (and (handempty) (obj-at o1 p4-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-3))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p2-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-1))))
			 (when (and (handempty) (obj-at o2 p2-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-2))))
			 (when (and (handempty) (obj-at o2 p2-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-3))))
			 (when (and (handempty) (obj-at o2 p3-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-1))))
			 (when (and (handempty) (obj-at o2 p3-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-2))))
			 (when (and (handempty) (obj-at o2 p3-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-3))))
			 (when (and (handempty) (obj-at o2 p4-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-1))))
			 (when (and (handempty) (obj-at o2 p4-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-2))))
			 (when (and (handempty) (obj-at o2 p4-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-3))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p2-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-1))))
			 (when (and (handempty) (obj-at o3 p2-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-2))))
			 (when (and (handempty) (obj-at o3 p2-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-3))))
			 (when (and (handempty) (obj-at o3 p3-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-1))))
			 (when (and (handempty) (obj-at o3 p3-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-2))))
			 (when (and (handempty) (obj-at o3 p3-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-3))))
			 (when (and (handempty) (obj-at o3 p4-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-1))))
			 (when (and (handempty) (obj-at o3 p4-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-2))))
			 (when (and (handempty) (obj-at o3 p4-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-3))))
		)
)
(:action pickup-3-3-look-1
		:parameters ()
		:precondition (located p3-3)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p2-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-2))))
			 (when (and (handempty) (obj-at o1 p2-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-3))))
			 (when (and (handempty) (obj-at o1 p2-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-4))))
			 (when (and (handempty) (obj-at o1 p3-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-2))))
			 (when (and (handempty) (obj-at o1 p3-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-3))))
			 (when (and (handempty) (obj-at o1 p3-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-4))))
			 (when (and (handempty) (obj-at o1 p4-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-2))))
			 (when (and (handempty) (obj-at o1 p4-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-3))))
			 (when (and (handempty) (obj-at o1 p4-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-4))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p2-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-2))))
			 (when (and (handempty) (obj-at o2 p2-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-3))))
			 (when (and (handempty) (obj-at o2 p2-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-4))))
			 (when (and (handempty) (obj-at o2 p3-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-2))))
			 (when (and (handempty) (obj-at o2 p3-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-3))))
			 (when (and (handempty) (obj-at o2 p3-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-4))))
			 (when (and (handempty) (obj-at o2 p4-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-2))))
			 (when (and (handempty) (obj-at o2 p4-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-3))))
			 (when (and (handempty) (obj-at o2 p4-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-4))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p2-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-2))))
			 (when (and (handempty) (obj-at o3 p2-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-3))))
			 (when (and (handempty) (obj-at o3 p2-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-4))))
			 (when (and (handempty) (obj-at o3 p3-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-2))))
			 (when (and (handempty) (obj-at o3 p3-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-3))))
			 (when (and (handempty) (obj-at o3 p3-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-4))))
			 (when (and (handempty) (obj-at o3 p4-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-2))))
			 (when (and (handempty) (obj-at o3 p4-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-3))))
			 (when (and (handempty) (obj-at o3 p4-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-4))))
		)
)
(:action pickup-3-4-look-1
		:parameters ()
		:precondition (located p3-4)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p2-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-3))))
			 (when (and (handempty) (obj-at o1 p2-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p2-4))))
			 (when (and (handempty) (obj-at o1 p3-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-3))))
			 (when (and (handempty) (obj-at o1 p3-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-4))))
			 (when (and (handempty) (obj-at o1 p4-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-3))))
			 (when (and (handempty) (obj-at o1 p4-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-4))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p2-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-3))))
			 (when (and (handempty) (obj-at o2 p2-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p2-4))))
			 (when (and (handempty) (obj-at o2 p3-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-3))))
			 (when (and (handempty) (obj-at o2 p3-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-4))))
			 (when (and (handempty) (obj-at o2 p4-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-3))))
			 (when (and (handempty) (obj-at o2 p4-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-4))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p2-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-3))))
			 (when (and (handempty) (obj-at o3 p2-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p2-4))))
			 (when (and (handempty) (obj-at o3 p3-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-3))))
			 (when (and (handempty) (obj-at o3 p3-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-4))))
			 (when (and (handempty) (obj-at o3 p4-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-3))))
			 (when (and (handempty) (obj-at o3 p4-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-4))))
		)
)
(:action pickup-4-1-look-1
		:parameters ()
		:precondition (located p4-1)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p3-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-1))))
			 (when (and (handempty) (obj-at o1 p3-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-2))))
			 (when (and (handempty) (obj-at o1 p4-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-1))))
			 (when (and (handempty) (obj-at o1 p4-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-2))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p3-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-1))))
			 (when (and (handempty) (obj-at o2 p3-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-2))))
			 (when (and (handempty) (obj-at o2 p4-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-1))))
			 (when (and (handempty) (obj-at o2 p4-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-2))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p3-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-1))))
			 (when (and (handempty) (obj-at o3 p3-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-2))))
			 (when (and (handempty) (obj-at o3 p4-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-1))))
			 (when (and (handempty) (obj-at o3 p4-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-2))))
		)
)
(:action pickup-4-2-look-1
		:parameters ()
		:precondition (located p4-2)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p3-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-1))))
			 (when (and (handempty) (obj-at o1 p3-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-2))))
			 (when (and (handempty) (obj-at o1 p3-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-3))))
			 (when (and (handempty) (obj-at o1 p4-1))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-1))))
			 (when (and (handempty) (obj-at o1 p4-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-2))))
			 (when (and (handempty) (obj-at o1 p4-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-3))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p3-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-1))))
			 (when (and (handempty) (obj-at o2 p3-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-2))))
			 (when (and (handempty) (obj-at o2 p3-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-3))))
			 (when (and (handempty) (obj-at o2 p4-1))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-1))))
			 (when (and (handempty) (obj-at o2 p4-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-2))))
			 (when (and (handempty) (obj-at o2 p4-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-3))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p3-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-1))))
			 (when (and (handempty) (obj-at o3 p3-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-2))))
			 (when (and (handempty) (obj-at o3 p3-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-3))))
			 (when (and (handempty) (obj-at o3 p4-1))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-1))))
			 (when (and (handempty) (obj-at o3 p4-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-2))))
			 (when (and (handempty) (obj-at o3 p4-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-3))))
		)
)
(:action pickup-4-3-look-1
		:parameters ()
		:precondition (located p4-3)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p3-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-2))))
			 (when (and (handempty) (obj-at o1 p3-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-3))))
			 (when (and (handempty) (obj-at o1 p3-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-4))))
			 (when (and (handempty) (obj-at o1 p4-2))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-2))))
			 (when (and (handempty) (obj-at o1 p4-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-3))))
			 (when (and (handempty) (obj-at o1 p4-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-4))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p3-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-2))))
			 (when (and (handempty) (obj-at o2 p3-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-3))))
			 (when (and (handempty) (obj-at o2 p3-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-4))))
			 (when (and (handempty) (obj-at o2 p4-2))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-2))))
			 (when (and (handempty) (obj-at o2 p4-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-3))))
			 (when (and (handempty) (obj-at o2 p4-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-4))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p3-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-2))))
			 (when (and (handempty) (obj-at o3 p3-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-3))))
			 (when (and (handempty) (obj-at o3 p3-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-4))))
			 (when (and (handempty) (obj-at o3 p4-2))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-2))))
			 (when (and (handempty) (obj-at o3 p4-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-3))))
			 (when (and (handempty) (obj-at o3 p4-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-4))))
		)
)
(:action pickup-4-4-look-1
		:parameters ()
		:precondition (located p4-4)
		:effect (and
			 (when (holding o1)
				 (and (handempty) (not (holding o1)) ))
			 (when (and (handempty) (obj-at o1 p3-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-3))))
			 (when (and (handempty) (obj-at o1 p3-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p3-4))))
			 (when (and (handempty) (obj-at o1 p4-3))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-3))))
			 (when (and (handempty) (obj-at o1 p4-4))
				 (and (not (handempty)) (holding o1) (not (obj-at o1 p4-4))))
			 (when (holding o2)
				 (and (handempty) (not (holding o2)) ))
			 (when (and (handempty) (obj-at o2 p3-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-3))))
			 (when (and (handempty) (obj-at o2 p3-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p3-4))))
			 (when (and (handempty) (obj-at o2 p4-3))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-3))))
			 (when (and (handempty) (obj-at o2 p4-4))
				 (and (not (handempty)) (holding o2) (not (obj-at o2 p4-4))))
			 (when (holding o3)
				 (and (handempty) (not (holding o3)) ))
			 (when (and (handempty) (obj-at o3 p3-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-3))))
			 (when (and (handempty) (obj-at o3 p3-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p3-4))))
			 (when (and (handempty) (obj-at o3 p4-3))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-3))))
			 (when (and (handempty) (obj-at o3 p4-4))
				 (and (not (handempty)) (holding o3) (not (obj-at o3 p4-4))))
		)
)

   
   (:action putdown
      :parameters (?p - position)
      :precondition (located ?p)
      :effect  
                (and 
			(when (holding o1)(and (handempty) (not (holding o1)) (obj-at o1 ?p)))
			(when (holding o2)(and (handempty) (not (holding o2)) (obj-at o2 ?p)))
			(when (holding o3)(and (handempty) (not (holding o3)) (obj-at o3 ?p)))
)
   )
)
