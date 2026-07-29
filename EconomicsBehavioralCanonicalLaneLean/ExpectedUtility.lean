import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure ExpectedUtilityPackage where
  preferenceRelation : Type
  utilityFunction : Type
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  monotonicity : Prop
  expectedUtilityRepresentation : Prop

structure ExpectedUtilityEvidence (U : ExpectedUtilityPackage) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  monotonicityClosed : U.monotonicity
  expectedUtilityRepresentationClosed : U.expectedUtilityRepresentation

def ExpectedUtilityClosed (U : ExpectedUtilityPackage) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity ∧ U.monotonicity ∧ U.expectedUtilityRepresentation

theorem expected_utility_closed_from_evidence (U : ExpectedUtilityPackage) (E : ExpectedUtilityEvidence U) :
    ExpectedUtilityClosed U := by
  exact And.intro E.completenessClosed (And.intro E.transitivityClosed (And.intro E.continuityClosed (And.intro E.monotonicityClosed E.expectedUtilityRepresentationClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse