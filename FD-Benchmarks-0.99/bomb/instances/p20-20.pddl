(define (problem bomb-20-20)(:domain bomb)(:objects bomb1 bomb2 bomb3 bomb4 bomb5 bomb6 bomb7 bomb8 bomb9 bomb10 bomb11 bomb12 bomb13 bomb14 bomb15 bomb16 bomb17 bomb18 bomb19 bomb20 toilet1 toilet2 toilet3 toilet4 toilet5 toilet6 toilet7 toilet8 toilet9 toilet10 toilet11 toilet12 toilet13 toilet14 toilet15 toilet16 toilet17 toilet18 toilet19 toilet20  - obj)

(:init (bomb bomb1)(bomb bomb2)(bomb bomb3)(bomb bomb4)(bomb bomb5)(bomb bomb6)(bomb bomb7)(bomb bomb8)(bomb bomb9)(bomb bomb10)(bomb bomb11)(bomb bomb12)(bomb bomb13)(bomb bomb14)(bomb bomb15)(bomb bomb16)(bomb bomb17)(bomb bomb18)(bomb bomb19)(bomb bomb20)(toilet toilet1)(toilet toilet2)(toilet toilet3)(toilet toilet4)(toilet toilet5)(toilet toilet6)(toilet toilet7)(toilet toilet8)(toilet toilet9)(toilet toilet10)(toilet toilet11)(toilet toilet12)(toilet toilet13)(toilet toilet14)(toilet toilet15)(toilet toilet16)(toilet toilet17)(toilet toilet18)(toilet toilet19)(toilet toilet20)                    

(cpt (armed bomb1) 0.05)(cpt (armed bomb2) 0.05)(cpt (armed bomb3) 0.05)(cpt (armed bomb4) 0.05)(cpt (armed bomb5) 0.05)(cpt (armed bomb6) 0.05)(cpt (armed bomb7) 0.05)(cpt (armed bomb8) 0.05)(cpt (armed bomb9) 0.05)(cpt (armed bomb10) 0.05)(cpt (armed bomb11) 0.05)(cpt (armed bomb12) 0.05)(cpt (armed bomb13) 0.05)(cpt (armed bomb14) 0.05)(cpt (armed bomb15) 0.05)(cpt (armed bomb16) 0.05)(cpt (armed bomb17) 0.05)(cpt (armed bomb18) 0.05)(cpt (armed bomb19) 0.05)(cpt (clogged toilet20) 0.05))

(:goal 0.99
(and(not (armed bomb1))(not (armed bomb2))(not (armed bomb3))(not (armed bomb4))(not (armed bomb5))(not (armed bomb6))(not (armed bomb7))(not (armed bomb8))(not (armed bomb9))(not (armed bomb10))(not (armed bomb11))(not (armed bomb12))(not (armed bomb13))(not (armed bomb14))(not (armed bomb15))(not (armed bomb16))(not (armed bomb17))(not (armed bomb18))(not (armed bomb19))(not (armed bomb20)))))