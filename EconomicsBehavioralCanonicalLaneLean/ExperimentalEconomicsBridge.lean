import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.PrimitiveChoiceBehavior

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure Experiment where
  subjects : Nat
  treatments : List String
  observedChoices : (PrimitiveChoiceSpace → PrimitiveChoiceSpace.alternatives) → Prop

define experimentalBridge (exp : Experiment) (theory : AdmissibleClass) : Prop :=
  match exp.treatments with
  | [] => True
  | t :: ts => (theory.endpointSatisfied ∨ theory.remainderRecorded) ∧ experimentalBridge { exp with treatments := ts } theory

structure ExperimentalEvidence (exp : Experiment) (theory : AdmissibleClass) where
  confirmation : experimentalBridge exp theory
  consistency : ∀ (choice : PrimitiveChoiceSpace → PrimitiveChoiceSpace.alternatives),
    exp.observedChoices choice →
    (theory.gateWitness)

theorem experimental_closure (exp : Experiment) (theory : AdmissibleClass) (E : ExperimentalEvidence exp theory) :
    ConstrainedTheoremClosure theory := by
  exact And.intro (bridge_from_admissible_class theory) (gate_from_admissible_class theory)

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse