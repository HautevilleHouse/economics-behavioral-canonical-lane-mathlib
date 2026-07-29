import EconomicsBehavioralCanonicalLaneLean.GrowthModel

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure AssetPricingPackage (G : GrowthModelPackage (U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage))) where
  stochasticDiscountFactor : Prop
  riskNeutralValuation : Prop
  ccAPMEquation : Prop
  assetPriceBubble : Prop
  noArbitrage : Prop

structure AssetPricingEvidence {G : GrowthModelPackage (U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage))} (A : AssetPricingPackage G) where
  stochasticDiscountFactorClosed : A.stochasticDiscountFactor
  riskNeutralValuationClosed : A.riskNeutralValuation
  ccAPMEquationClosed : A.ccAPMEquation
  assetPriceBubbleClosed : A.assetPriceBubble
  noArbitrageClosed : A.noArbitrage

def AssetPricingClosed {G : GrowthModelPackage (U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage))} (A : AssetPricingPackage G) : Prop :=
  A.stochasticDiscountFactor ∧ A.riskNeutralValuation ∧ A.ccAPMEquation ∧ A.assetPriceBubble ∧ A.noArbitrage

theorem asset_pricing_closed_from_evidence
    {G : GrowthModelPackage (U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage))} (A : AssetPricingPackage G) (Ev : AssetPricingEvidence A) :
    AssetPricingClosed A := by
  exact And.intro Ev.stochasticDiscountFactorClosed
    (And.intro Ev.riskNeutralValuationClosed
      (And.intro Ev.ccAPMEquationClosed
        (And.intro Ev.assetPriceBubbleClosed Ev.noArbitrageClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse