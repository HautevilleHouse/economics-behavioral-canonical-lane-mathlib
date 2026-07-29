import EconomicsBehavioralCanonicalLaneLean.UtilityTheory

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure GrowthModelPackage (U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage)) where
  productionFunction : E.commoditySpace → E.commoditySpace
  capitalAccumulation : Prop
  resourceConstraint : Prop
  optimalGrowthPath : Prop
  steadyStateStability : Prop

structure GrowthModelEvidence {U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage)} (G : GrowthModelPackage U) where
  capitalAccumulationClosed : G.capitalAccumulation
  resourceConstraintClosed : G.resourceConstraint
  optimalGrowthPathClosed : G.optimalGrowthPath
  steadyStateStabilityClosed : G.steadyStateStability

def GrowthModelClosed {U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage)} (G : GrowthModelPackage U) : Prop :=
  G.capitalAccumulation ∧ G.resourceConstraint ∧ G.optimalGrowthPath ∧ G.steadyStateStability

theorem growth_model_closed_from_evidence
    {U : UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage)} (G : GrowthModelPackage U) (Ev : GrowthModelEvidence G) :
    GrowthModelClosed G := by
  exact And.intro Ev.capitalAccumulationClosed
    (And.intro Ev.resourceConstraintClosed
      (And.intro Ev.optimalGrowthPathClosed Ev.steadyStateStabilityClosed))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse