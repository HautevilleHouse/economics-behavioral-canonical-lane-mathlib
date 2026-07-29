import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure UtilityPreferencePackage where
  consumptionSet : Type u
  preferenceRelation : consumptionSet → consumptionSet → Prop
  completeness : ∀ x y : consumptionSet, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z : consumptionSet, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  continuity : Prop
  monotonicity : Prop
  convexity : Prop

structure UtilityRepresentationPackage (U : UtilityPreferencePackage) where
  utilityFunction : U.consumptionSet → ℝ
  representationProperty : ∀ x y : U.consumptionSet, U.preferenceRelation x y ↔ utilityFunction x ≥ utilityFunction y
  continuityOfUtility : Prop
  uniquenessUpToMonotoneTransform : Prop

structure UtilityRepresentationEvidence {U : UtilityPreferencePackage} (R : UtilityRepresentationPackage U) where
  representationPropertyClosed : R.representationProperty
  continuityOfUtilityClosed : R.continuityOfUtility

def UtilityRepresentationClosed {U : UtilityPreferencePackage} (R : UtilityRepresentationPackage U) : Prop :=
  R.representationProperty ∧ R.continuityOfUtility ∧ R.uniquenessUpToMonotoneTransform

theorem utility_representation_closed_from_evidence
    {U : UtilityPreferencePackage} (R : UtilityRepresentationPackage U)
    (E : UtilityRepresentationEvidence R) : UtilityRepresentationClosed R := by
  exact And.intro E.representationPropertyClosed
    (And.intro E.continuityOfUtilityClosed R.uniquenessUpToMonotoneTransform)

end HautevilleHouse
end EconomicsBehavioralCanonicalLaneLean
