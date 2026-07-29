import EconomicsBehavioralCanonicalLaneLean.ArrowDebreuEquilibrium

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure UtilityTheoryPackage (E : ArrowDebreuEquilibriumPackage) where
  preferenceRelation : Type u
  utilityFunction : E.commoditySpace → ℝ
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  monotonicity : Prop
  convexity : Prop
  representability : Prop

structure UtilityTheoryEvidence {E : ArrowDebreuEquilibriumPackage} (U : UtilityTheoryPackage E) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  monotonicityClosed : U.monotonicity
  convexityClosed : U.convexity
  representabilityClosed : U.representability

def UtilityTheoryClosed {E : ArrowDebreuEquilibriumPackage} (U : UtilityTheoryPackage E) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity ∧ U.monotonicity ∧ U.convexity ∧ U.representability

theorem utility_theory_closed_from_evidence
    {E : ArrowDebreuEquilibriumPackage} (U : UtilityTheoryPackage E) (Ev : UtilityTheoryEvidence U) :
    UtilityTheoryClosed U := by
  exact And.intro Ev.completenessClosed
    (And.intro Ev.transitivityClosed
      (And.intro Ev.continuityClosed
        (And.intro Ev.monotonicityClosed
          (And.intro Ev.convexityClosed Ev.representabilityClosed))))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse