import EconomicsBehavioralCanonicalLaneLean.AssetPricing

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure BehavioralBiasPackage (A : AssetPricingPackage (G : GrowthModelPackage (U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage)))) where
  prospectTheory : Prop
  hyperbolicDiscounting : Prop
  anchoringOverconfidence : Prop
  framingEffects : Prop
  marketAnomaly : Prop

structure BehavioralBiasEvidence {A : AssetPricingPackage (G : GrowthModelPackage (U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage)))} (B : BehavioralBiasPackage A) where
  prospectTheoryClosed : B.prospectTheory
  hyperbolicDiscountingClosed : B.hyperbolicDiscounting
  anchoringOverconfidenceClosed : B.anchoringOverconfidence
  framingEffectsClosed : B.framingEffects
  marketAnomalyClosed : B.marketAnomaly

def BehavioralBiasClosed {A : AssetPricingPackage (G : GrowthModelPackage (U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage)))} (B : BehavioralBiasPackage A) : Prop :=
  B.prospectTheory ∧ B.hyperbolicDiscounting ∧ B.anchoringOverconfidence ∧ B.framingEffects ∧ B.marketAnomaly

theorem behavioral_bias_closed_from_evidence
    {A : AssetPricingPackage (G : GrowthModelPackage (U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage)))} (B : BehavioralBiasPackage A) (Ev : BehavioralBiasEvidence B) :
    BehavioralBiasClosed B := by
  exact And.intro Ev.prospectTheoryClosed
    (And.intro Ev.hyperbolicDiscountingClosed
      (And.intro Ev.anchoringOverconfidenceClosed
        (And.intro Ev.framingEffectsClosed Ev.marketAnomalyClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse