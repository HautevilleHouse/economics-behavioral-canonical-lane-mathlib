import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.UtilityPreferencesClosure

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure ProspectTheoryPackage (U : BehavioralUtilityPackage) where
  referencePoint : ℝ
  valueFunction : ℝ → ℝ
  lossAversion : Prop
  probabilityWeighting : ℝ → ℝ
  overweightingLowProb : Prop
  underweightingHighProb : Prop

structure ProspectTheoryEvidence {U : BehavioralUtilityPackage} (PT : ProspectTheoryPackage U) where
  lossAversionClosed : PT.lossAversion
  overweightingLowProbClosed : PT.overweightingLowProb
  underweightingHighProbClosed : PT.underweightingHighProb

def ProspectTheoryClosed {U : BehavioralUtilityPackage} (PT : ProspectTheoryPackage U) : Prop :=
  PT.lossAversion ∧ PT.overweightingLowProb ∧ PT.underweightingHighProb

theorem prospect_theory_closed_from_evidence {U : BehavioralUtilityPackage}
    (PT : ProspectTheoryPackage U) (E : ProspectTheoryEvidence PT) : ProspectTheoryClosed PT :=
  And.intro E.lossAversionClosed (And.intro E.overweightingLowProbClosed E.underweightingHighProbClosed)

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse