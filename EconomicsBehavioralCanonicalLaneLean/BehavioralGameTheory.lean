import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure BehavioralGamePackage where
  players : Type u
  strategies : players → Type v
  payoffs : (p : players) → strategies p → ℝ
  socialPreferences : Prop
  reciprocity : Prop
  fairness : Prop
  boundedRationality : Prop

structure BehavioralGameEvidence (B : BehavioralGamePackage) where
  socialPreferencesClosed : B.socialPreferences
  reciprocityClosed : B.reciprocity
  fairnessClosed : B.fairness
  boundedRationalityClosed : B.boundedRationality

def BehavioralGameClosed (B : BehavioralGamePackage) : Prop :=
  B.socialPreferences ∧ B.reciprocity ∧ B.fairness ∧ B.boundedRationality

theorem behavioral_game_closed_from_evidence (B : BehavioralGamePackage)
    (Ev : BehavioralGameEvidence B) : BehavioralGameClosed B := by
  exact And.intro Ev.socialPreferencesClosed
    (And.intro Ev.reciprocityClosed
      (And.intro Ev.fairnessClosed Ev.boundedRationalityClosed))

end HautevilleHouse
end EconomicsBehavioralCanonicalLaneLean
