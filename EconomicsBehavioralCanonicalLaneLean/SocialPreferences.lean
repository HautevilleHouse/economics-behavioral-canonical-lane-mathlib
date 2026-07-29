import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.TimeInconsistency

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure SocialPreferencesPackage where
  altruism : Prop
  reciprocity : Prop
  inequityAversion : Prop
  fairness : Prop
  socialNorms : Prop

structure SocialPreferencesEvidence (S : SocialPreferencesPackage) where
  altruismClosed : S.altruism
  reciprocityClosed : S.reciprocity
  inequityAversionClosed : S.inequityAversion
  fairnessClosed : S.fairness
  socialNormsClosed : S.socialNorms

def SocialPreferencesClosed (S : SocialPreferencesPackage) : Prop :=
  S.altruism ∧ S.reciprocity ∧ S.inequityAversion ∧ S.fairness ∧ S.socialNorms

theorem social_preferences_closed_from_evidence (S : SocialPreferencesPackage) (E : SocialPreferencesEvidence S) :
    SocialPreferencesClosed S := by
  exact And.intro E.altruismClosed (And.intro E.reciprocityClosed (And.intro E.inequityAversionClosed (And.intro E.fairnessClosed E.socialNormsClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse