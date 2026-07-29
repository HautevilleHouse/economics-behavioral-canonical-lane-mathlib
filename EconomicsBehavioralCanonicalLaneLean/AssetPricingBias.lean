import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.UtilityPreferencesClosure

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure AssetPricingBiasPackage (U : BehavioralUtilityPackage) where
  stateSpace : Type u
  assetPayoffs : stateSpace → ℝ
  probabilityMeasure : stateSpace → ℝ
  riskAversion : Prop
  lossAversionPremium : Prop
  overconfidenceBias : Prop

structure AssetPricingBiasEvidence {U : BehavioralUtilityPackage} (APB : AssetPricingBiasPackage U) where
  riskAversionClosed : APB.riskAversion
  lossAversionPremiumClosed : APB.lossAversionPremium
  overconfidenceBiasClosed : APB.overconfidenceBias

def AssetPricingBiasClosed {U : BehavioralUtilityPackage} (APB : AssetPricingBiasPackage U) : Prop :=
  APB.riskAversion ∧ APB.lossAversionPremium ∧ APB.overconfidenceBias

theorem asset_pricing_bias_closed_from_evidence {U : BehavioralUtilityPackage}
    (APB : AssetPricingBiasPackage U) (E : AssetPricingBiasEvidence APB) : AssetPricingBiasClosed APB :=
  And.intro E.riskAversionClosed (And.intro E.lossAversionPremiumClosed E.overconfidenceBiasClosed)

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse