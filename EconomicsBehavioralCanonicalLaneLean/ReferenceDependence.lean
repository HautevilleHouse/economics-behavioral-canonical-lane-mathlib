import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure ReferenceDependencePackage where
  referencePoint : Type u
  outcomeSpace : Type v
  gainLossUtility : Type w
  lossAversion : Prop
  diminishingSensitivity : Prop
  referenceDependence : Prop
  valueFunctionDefined : Prop

structure ReferenceDependenceEvidence (R : ReferenceDependencePackage) where
  lossAversionClosed : R.lossAversion
  diminishingSensitivityClosed : R.diminishingSensitivity
  referenceDependenceClosed : R.referenceDependence
  valueFunctionDefinedClosed : R.valueFunctionDefined

def ReferenceDependenceClosed (R : ReferenceDependencePackage) : Prop :=
  R.lossAversion ∧ R.diminishingSensitivity ∧ R.referenceDependence ∧ R.valueFunctionDefined

theorem reference_dependence_closed_from_evidence (R : ReferenceDependencePackage) (E : ReferenceDependenceEvidence R) : ReferenceDependenceClosed R := by
  exact And.intro E.lossAversionClosed
    (And.intro E.diminishingSensitivityClosed
      (And.intro E.referenceDependenceClosed E.valueFunctionDefinedClosed))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse
