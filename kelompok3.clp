;;;======================================================
;;;   Animal Identification Expert System
;;;
;;;     A simple expert system which attempts to identify
;;;     an animal based on its characteristics.
;;;     The knowledge base in this example is a 
;;;     collection of facts which represent backward
;;;     chaining rules. CLIPS forward chaining rules are
;;;     then used to simulate a backward chaining inference
;;;     engine.
;;;
;;;     CLIPS Version 6.4 Example
;;; 
;;;     To execute, merely load, reset, and run.
;;;     Answer questions yes or no.
;;;======================================================

(defmodule MAIN (export ?ALL)) 

(defmodule CHAIN (import MAIN ?ALL))

(defmodule ASK (import MAIN ?ALL))

;;;*************************
;;;* DEFGLOBAL DEFINITIONS *
;;;*************************

(defglobal MAIN
   ?*rule-index* = 1)

;;;***************************
;;;* DEFFUNCTION DEFINITIONS *
;;;***************************

(deffunction generate-rule-name ()
   (bind ?name (sym-cat rule- ?*rule-index*))
   (bind ?*rule-index* (+ ?*rule-index* 1))
   (return ?name))

;;;***************************
;;;* DEFTEMPLATE DEFINITIONS *
;;;***************************

(deftemplate MAIN::rule 
   (slot name (default-dynamic (generate-rule-name)))
   (slot validate (default no))
   (multislot if)
   (multislot then)
   (multislot processed))
   
(deftemplate MAIN::question
   (multislot valid-answers)
   (slot variable)
   (slot query))

(deftemplate MAIN::answer
   (slot variable)
   (slot prefix (default ""))
   (slot postfix (default "")))
   
(deftemplate MAIN::goal
   (slot variable))
   
(deftemplate MAIN::variable
   (slot name)
   (slot value))
   
(deftemplate MAIN::activity)

(deftemplate MAIN::legalanswers
   (multislot values))
   
;;;**************************
;;;* INFERENCE ENGINE RULES *
;;;**************************

(defrule MAIN::startup
   =>
   (focus CHAIN ASK))
   
(defrule MAIN::continue
   (declare (salience -10))
   ?f <- (activity)
   =>
   (retract ?f)
   (focus CHAIN ASK))
   
(defrule MAIN::goal-satified ""
   (goal (variable ?goal))
   (variable (name ?goal) (value ?value))
   (answer (prefix ?prefix) (postfix ?postfix) (variable ?goal))
   =>
   (println ?prefix ?value ?postfix))

;;; ##################
;;; CHAIN MODULE RULES 
;;; ##################

(defrule CHAIN::propagate-goal ""
   (logical (goal (variable ?goal))
            (rule (if ?variable $?)
                  (then ?goal ? ?value)))
   =>
   (assert (goal (variable ?variable))))

(defrule CHAIN::modify-rule-match-is ""
   (variable (name ?variable) (value ?value))
   ?f <- (rule (if ?variable is ?value and $?rest)
               (processed $?p))
   =>
   (modify ?f (if ?rest)
              (processed ?p ?variable is ?value and)))

(defrule CHAIN::rule-satisfied-is ""
   (variable (name ?variable) (value ?value))
   ?f <- (rule (if ?variable is ?value)
               (then ?goal ? ?goal-value)
               (processed $?p))
   =>
   (modify ?f (if) 
              (processed ?p ?variable is ?value #)))
              
(defrule CHAIN::apply-rule ""
   (logical (rule (if)
                  (then ?goal ? ?goal-value)))
   =>
   (assert (variable (name ?goal) (value ?goal-value))))

;;; ################
;;; ASK MODULE RULES 
;;; ################

(defrule ASK::ask-question-no-legalvalues ""
   (not (legalanswers))
   ?f1 <- (goal (variable ?variable))
   (question (variable ?variable) (query ?text))
   (not (variable (name ?variable)))
   =>
   (assert (activity))
   (retract ?f1)
   (print ?text " ")
   (assert (variable (name ?variable) (value (read)))))

(defrule ASK::ask-question-legalvalues ""
   (legalanswers (values $?answers))
   ?f1 <- (goal (variable ?variable))
   (question (variable ?variable) (query ?text))
   (not (variable (name ?variable)))
   =>
   (assert (activity))
   (retract ?f1)
   (print ?text " ")
   (print ?answers " ")
   (bind ?reply (read))
   (if (lexemep ?reply)
      then
      (bind ?reply (lowcase ?reply)))
   (if (member$ ?reply ?answers) 
     then (assert (variable (name ?variable) (value ?reply)))
     else (assert (goal (variable ?variable)))))

;;;***************************
;;;* DEFFACTS KNOWLEDGE BASE *
;;;***************************

(deffacts MAIN::knowledge-base 
   (goal (variable daging))
   (legalanswers (values sei-sapi daging-asap sup rawon soto bakso semur steak sup-iga iga-bakar konro yakiniku shabu-shabu daging-cincang kornet bacon-sapi sate abon oseng-daging rendang dendeng empal bakso-urat kaldu buntut-bakar sate-padang lidah-goreng lidah-tumis bahan-aditif))
   (rule (if masakan is sei-sapi) 
         (then daging is neck))
   (rule (if masakan is daging-asap) 
         (then daging is neck))
   (rule (if masakan is sup) 
         (then daging is brisket))   
   (rule (if masakan is rawon) 
         (then daging is brisket))
   (rule (if masakan is soto) 
         (then daging is brisket))
   (rule (if masakan is bakso) 
         (then daging is chuck))
   (rule (if masakan is semur) 
         (then daging is chuck))
   (rule (if masakan is steak) 
         (then daging is tenderloin))
   (rule (if masakan is sup-iga) 
         (then daging is rib))
   (rule (if masakan is iga-bakar) 
         (then daging is rib))
   (rule (if masakan is konro) 
         (then daging is rib))
   (rule (if masakan is yakiniku) 
         (then daging is sirloin))
   (rule (if masakan is shabu-shabu) 
         (then daging is sirloin))
   (rule (if masakan is daging-cincang) 
         (then daging is short-plate))
   (rule (if masakan is kornet) 
         (then daging is short-plate))
   (rule (if masakan is bacon-sapi) 
         (then daging is short-plate))
   (rule (if masakan is sate) 
         (then daging is rump-cap))
   (rule (if masakan is abon) 
         (then daging is rump-cap))
   (rule (if masakan is oseng-daging) 
         (then daging is rump-cap))
   (rule (if masakan is rendang) 
         (then daging is round))
   (rule (if masakan is dendeng) 
         (then daging is round))
   (rule (if masakan is empal) 
         (then daging is round))
   (rule (if masakan is bakso-urat) 
         (then daging is shank))
   (rule (if masakan is kaldu) 
         (then daging is oxtail))
   (rule (if masakan is buntut-bakar) 
         (then daging is oxtail))
   (rule (if masakan is sate-padang) 
         (then daging is tongue))
   (rule (if masakan is lidah-goreng) 
         (then daging is tongue))
   (rule (if masakan is lidah-tumis) 
         (then daging is tongue))
   (rule (if masakan is bahan-aditif) 
         (then daging is pink-slime))

   (question (variable masakan)
             (query "Hari ini ingin memasak apa?"))        
   (answer (prefix "Anda memerlukan potongan daging bagian ") (variable daging) (postfix ".")))
