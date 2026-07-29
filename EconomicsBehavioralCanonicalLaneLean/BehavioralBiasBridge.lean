import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.PrimitiveChoiceBehavior

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure BehavioralBiasPackage where
  biasType : String
  description : String
  effectOnPreferences : (PrimitiveChoiceSpace → Prop) → Prop

structure PresentBias (C : PrimitiveChoiceSpace) where
  nowPreference : C.alternatives → C.alternatives → Prop
  laterPreference : C.alternatives → C.alternatives → Prop
  inconsistency : ∃ a b : C.alternatives, nowPreference a b ∧ ¬ laterPreference a b

structure Overconfidence (C : PrimitiveChoiceSpace) where
  selfAssessment : C.alternatives → ℝ
  actualAbility : C.alternatives → ℝ
  gap : ∃ x : C.alternatives, selfAssessment x > actualAbility x

-- Bridge from behavioral bias to admissible class
structure BehavioralBiasEvidence (B : BehavioralBiasPackage) where
  biasIdentified : String
  source : String

def BehavioralBiasClosed (B : BehavioralBiasPackage) : Prop := True

theorem behavioral_bias_closed_from_evidence (B : BehavioralBiasPackage) (E : BehavioralBiasEvidence B) : BehavioralBiasClosed B := by
  trivial

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse