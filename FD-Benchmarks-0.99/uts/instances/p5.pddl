(define (problem k10)  (:domain uts)  (:objects n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - node)  (:init  (edge n1 n2)              (edge n1 n3)              (edge n1 n4)              (edge n1 n5)              (edge n1 n6)              (edge n1 n7)              (edge n1 n8)              (edge n1 n9)              (edge n1 n10)              (edge n2 n1)              (edge n2 n3)              (edge n2 n4)              (edge n2 n5)              (edge n2 n6)              (edge n2 n7)              (edge n2 n8)              (edge n2 n9)              (edge n2 n10)              (edge n3 n1)              (edge n3 n2)              (edge n3 n4)              (edge n3 n5)              (edge n3 n6)              (edge n3 n7)              (edge n3 n8)              (edge n3 n9)              (edge n3 n10)              (edge n4 n1)              (edge n4 n2)              (edge n4 n3)              (edge n4 n5)              (edge n4 n6)              (edge n4 n7)              (edge n4 n8)              (edge n4 n9)              (edge n4 n10)              (edge n5 n1)              (edge n5 n2)              (edge n5 n3)              (edge n5 n4)              (edge n5 n6)              (edge n5 n7)              (edge n5 n8)              (edge n5 n9)              (edge n5 n10)              (edge n6 n1)              (edge n6 n2)              (edge n6 n3)              (edge n6 n4)              (edge n6 n5)              (edge n6 n7)              (edge n6 n8)              (edge n6 n9)              (edge n6 n10)              (edge n7 n1)              (edge n7 n2)              (edge n7 n3)              (edge n7 n4)              (edge n7 n5)              (edge n7 n6)              (edge n7 n8)              (edge n7 n9)              (edge n7 n10)              (edge n8 n1)              (edge n8 n2)              (edge n8 n3)              (edge n8 n4)              (edge n8 n5)              (edge n8 n6)              (edge n8 n7)              (edge n8 n9)              (edge n8 n10)              (edge n9 n1)              (edge n9 n2)              (edge n9 n3)              (edge n9 n4)              (edge n9 n5)              (edge n9 n6)              (edge n9 n7)              (edge n9 n8)              (edge n9 n10)              (edge n10 n1)              (edge n10 n2)              (edge n10 n3)              (edge n10 n4)              (edge n10 n5)              (edge n10 n6)              (edge n10 n7)              (edge n10 n8)              (edge n10 n9)              
(cpt (located n1) 0.1)              
(cpt (located n2) 0.1)              
(cpt (located n3) 0.1)              
(cpt (located n4) 0.1)              
(cpt (located n5) 0.1)              
(cpt (located n6) 0.1)              
(cpt (located n7) 0.1)              
(cpt (located n8) 0.1)                 
(cpt (located n9) 0.1)              
(cpt (located n10)  0.1) 
(multi (located n1) (located n2) (located n3) (located n4) (located n5) (located n6) (located n7) (located n8) (located n9) (located n10))                            
             

)  
(:goal 0.99
(and (visited n1) (visited n2) (visited n3) (visited n4) (visited n5) (visited n6) (visited n7) (visited n8) (visited n9) (visited n10))))