import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure BehavioralUtilityPackage where
  consumptionSet : Type u
  preferenceRelation : consumptionSet → consumptionSet → Prop
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  monotonicity : Prop
  utilityFunctionExists : consumptionSet → ℝ

structure BehavioralUtilityEvidence (U : BehavioralUtilityPackage) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  monotonicityClosed : U.monotonicity

def UtilityPreferencesClosed (U : BehavioralUtilityPackage) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity ∧ U.monotonicity

theorem utility_preferences_closed_from_evidence (U : BehavioralUtilityPackage)
    (E : BehavioralUtilityEvidence U) : UtilityPreferencesClosed U :=
  And.intro E.completenessClosed (And.intro E.transitivityClosed (And.intro E.continuityClosed E.monotonicityClosed))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse