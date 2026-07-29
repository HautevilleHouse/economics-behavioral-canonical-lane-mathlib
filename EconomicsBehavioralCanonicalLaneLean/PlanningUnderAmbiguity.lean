import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure AmbiguityPackage where
  priorSet : Type u
  actSpace : Type v
  stateSpace : Type w
  outcomeSpace : Type x
  preferences : Type y
  priorSetNonempty : Prop
  actMeasurable : Prop
  preferenceComplete : Prop
  preferenceTransitive : Prop
  ambiguityAversion : Prop

structure AmbiguityEvidence (A : AmbiguityPackage) where
  priorSetNonemptyClosed : A.priorSetNonempty
  actMeasurableClosed : A.actMeasurable
  preferenceCompleteClosed : A.preferenceComplete
  preferenceTransitiveClosed : A.preferenceTransitive
  ambiguityAversionClosed : A.ambiguityAversion

def AmbiguityClosed (A : AmbiguityPackage) : Prop :=
  A.priorSetNonempty ∧ A.actMeasurable ∧ A.preferenceComplete ∧ A.preferenceTransitive ∧ A.ambiguityAversion

theorem ambiguity_closed_from_evidence (A : AmbiguityPackage) (E : AmbiguityEvidence A) : AmbiguityClosed A := by
  exact And.intro E.priorSetNonemptyClosed
    (And.intro E.actMeasurableClosed
      (And.intro E.preferenceCompleteClosed
        (And.intro E.preferenceTransitiveClosed E.ambiguityAversionClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse
