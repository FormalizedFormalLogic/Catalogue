import Catalogue.Init
import Catalogue.Arithmetic.ISigma0
import Catalogue.Arithmetic.ISigma1
import Catalogue.Arithmetic.Goedel1
import Catalogue.Arithmetic.Goedel2
import Catalogue.Arithmetic.Löb
import Catalogue.Arithmetic.Tarski

open Verso.Genre
open Verso.Genre.Manual
open Verso.Genre.Manual.InlineLean

open LO FirstOrder Arithmetic

set_option verso.docstring.allowMissing true
set_option linter.tacticAnalysis false
#doc (Manual) "Arithmetic" =>
%%%
tag := "arithmetics"
%%%

In this formalization, we prefer developing arithmetic _model theoretic_, i.e.
show $`T \models \sigma` instead of $`T \vdash \sigma` (They are equivalent thanks to the completeness theorem.).

```lean
variable {V : Type*} [ORingStructure V] [V ⊧ₘ* 𝗜𝚺₁]
```

This procedure is done as follows.
Suppose we wish to prove that the totality of an exponential function can be proved in $`\mathsf{I}\Sigma_1`
First, the graph of the exponential function must be defined. This is achieved by the following two definitions.

1 By working in model of $`\mathsf{I}Σ_1`, declare the semantic definition of the graph of the exponential function.

{docstring LO.FirstOrder.Arithmetic.Exponential}

2 Declare the syntactic definition of the semantic definition.

{docstring LO.FirstOrder.Arithmetic.Exponential.defined}

Then prove the totality.

```lean
lemma range_exists (x : V) : ∃ y, Exponential x y := by
  induction x using ISigma1.sigma1_succ_induction
  · definability
  case zero =>
    exact ⟨1, by simp⟩
  case succ x IH =>
    rcases IH with ⟨y, IH⟩
    exact ⟨2 * y, IH.succ⟩
```

Since `Exponential` and `Exponential.total` are defined in all the model of $`\mathsf{I}\Sigma_1`,
`𝐈𝚺₁ ⊢ ∀' ∃' exponentialDef` is obtained by the completeness theorem.

```lean
lemma exp_total :
    𝗜𝚺₁ ⊢ “∀ x, ∃ y, !↑exponentialDef x y” := by
  apply provable_of_models.{0}
  intro V _ _
  suffices ∀ x : V, ∃ y, Exponential x y by
    simpa [models_iff]
  exact range_exists
```

This was the result we wanted to achieve.

This approach has several advantages:

1 In general, writing a formalized proof (in formalized system!) is very tedious.
    Meta-proofs, on the other hand, tend to be relatively concise.
2 Many definitions and proofs of logic and algebra in Mathlib can be used.
3 Metaprogramming can streamline the proof process (especially `definability`).
4 It is easy to extend predicates and functions.
    When adding predicates or functions, it is necessary to extend its language by _extension by definition_ in case of formalized proof,
    but not in model theoretic approach.

{include 0 Catalogue.Arithmetic.ISigma0}

{include 0 Catalogue.Arithmetic.ISigma1}

{include 0 Catalogue.Arithmetic.Goedel1}

{include 0 Catalogue.Arithmetic.Goedel2}

{include 0 Catalogue.Arithmetic.Löb}

{include 0 Catalogue.Arithmetic.Tarski}
