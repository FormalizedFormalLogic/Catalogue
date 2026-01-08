import Catalogue.Init

open Verso.Genre
open Verso.Genre.Manual
open Verso.Genre.Manual.InlineLean

set_option verso.docstring.allowMissing true
set_option linter.unusedSectionVars false

open LO Entailment FirstOrder Arithmetic Bootstrapping Bootstrapping.Arithmetic

#doc (Manual) "Tarski's Undefinability Theorem" =>
%%%
tag := "tarski-undefinability"
%%%

Tarski's undefinability theorem states that the arithmetical truth cannot be defined in arithmetic itself.

To show this, we first prove the below lemma.
This lemma states that there is no predicate `τ` s.t. for any sentence `σ`,
`σ` is provable in a theory `T` iff `τ/[⌜σ⌝]` is so.

{docstring LO.FirstOrder.Arithmetic.not_exists_tarski_predicate}

Then, the main theorem is obtained by using theory `T` as True Arithmetic `𝗧𝗔`.

{docstring LO.FirstOrder.Arithmetic.undefinability_of_truth}
