import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.Nudging

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure BoundedRationalityPackage where
  satisficing : Prop
  heuristicDecisionMaking : Prop
  cognitiveBiases : Prop
  ecologicalRationality : Prop
  adaptiveToolkit : Prop

structure BoundedRationalityEvidence (B : BoundedRationalityPackage) where
  satisficingClosed : B.satisficing
  heuristicDecisionMakingClosed : B.heuristicDecisionMaking
  cognitiveBiasesClosed : B.cognitiveBiases
  ecologicalRationalityClosed : B.ecologicalRationality
  adaptiveToolkitClosed : B.adaptiveToolkit

def BoundedRationalityClosed (B : BoundedRationalityPackage) : Prop :=
  B.satisficing ∧ B.heuristicDecisionMaking ∧ B.cognitiveBiases ∧ B.ecologicalRationality ∧ B.adaptiveToolkit

theorem bounded_rationality_closed_from_evidence (B : BoundedRationalityPackage) (E : BoundedRationalityEvidence B) :
    BoundedRationalityClosed B := by
  exact And.intro E.satisficingClosed (And.intro E.heuristicDecisionMakingClosed (And.intro E.cognitiveBiasesClosed (And.intro E.ecologicalRationalityClosed E.adaptiveToolkitClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse