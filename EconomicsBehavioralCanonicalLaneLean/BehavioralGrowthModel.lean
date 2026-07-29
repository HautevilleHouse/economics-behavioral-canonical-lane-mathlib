import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.UtilityPreferencesClosure

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure BehavioralGrowthPackage (U : BehavioralUtilityPackage) where
  capitalStock : Type u
  productionFunction : capitalStock → capitalStock
  savingsRate : ℝ
  timeHorizon : ℝ
  steadyStateGrowth : Prop
  behavioralBiasAdjustment : Prop

structure BehavioralGrowthEvidence {U : BehavioralUtilityPackage} (BG : BehavioralGrowthPackage U) where
  steadyStateGrowthClosed : BG.steadyStateGrowth
  behavioralBiasAdjustmentClosed : BG.behavioralBiasAdjustment

def BehavioralGrowthClosed {U : BehavioralUtilityPackage} (BG : BehavioralGrowthPackage U) : Prop :=
  BG.steadyStateGrowth ∧ BG.behavioralBiasAdjustment

theorem behavioral_growth_closed_from_evidence {U : BehavioralUtilityPackage}
    (BG : BehavioralGrowthPackage U) (E : BehavioralGrowthEvidence BG) : BehavioralGrowthClosed BG :=
  And.intro E.steadyStateGrowthClosed E.behavioralBiasAdjustmentClosed

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse