import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.PrimitiveChoiceBehavior

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure Prospect (outcomes : List ℝ) (probabilities : List ℝ) where
  outcomes_nonempty : outcomes ≠ []
  probabilities_nonempty : probabilities ≠ []
  length_eq : outcomes.length = probabilities.length

define valueFunction (x : ℝ) (α : ℝ) : ℝ :=
  if x ≥ 0 then x ^ α else -((-x) ^ α)

define weightingFunction (p : ℝ) (γ : ℝ) : ℝ :=
  p ^ γ / ((p ^ γ + (1 - p) ^ γ) ^ (1 / γ))

structure ProspectTheoryEvaluation (P : Prospect) (α γ : ℝ) where
  editedProspect : (List ℝ) × (List ℝ)  -- edited outcomes and probabilities
  value : ℝ := List.sum (List.zipWith (λ x p => valueFunction x α * weightingFunction p γ) P.outcomes P.probabilities)

TheoryConstantAdmissible : AdmissibleClass := {
  object := ...
  endpointSatisfied := ...
  remainderRecorded := True
  gateWitness := Or.inr True.intro
}

theorem prospect_theory_closure (A : AdmissibleClass) : ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse