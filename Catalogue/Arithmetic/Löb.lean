import Catalogue.Init

open Verso.Genre
open Verso.Genre.Manual
open Verso.Genre.Manual.InlineLean

set_option verso.docstring.allowMissing true
set_option linter.unusedSectionVars false

open LO Entailment FirstOrder Arithmetic Bootstrapping Bootstrapping.Arithmetic

#doc (Manual) "Löb's Theorem" =>
%%%
tag := "löb-theorem"
%%%

Löb's theorem loughly states that for any sentence `σ`,
assume "if `σ` is provable, then `σ` is true", then `σ` is true.

{docstring LO.FirstOrder.Arithmetic.löb_theorem}

The argument can be formalized within arithmetic.

{docstring LO.FirstOrder.Arithmetic.formalized_löb_theorem}

In the perspective of modal logic, this is modal axiom `L`.
