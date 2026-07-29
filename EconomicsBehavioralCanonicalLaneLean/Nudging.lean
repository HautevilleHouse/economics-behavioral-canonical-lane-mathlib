import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.SocialPreferences

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure NudgingPackage where
  choiceArchitecture : Prop
  defaultOption : Prop
  framing : Prop
  salience : Prop
  commitment : Prop

structure NudgingEvidence (N : NudgingPackage) where
  choiceArchitectureClosed : N.choiceArchitecture
  defaultOptionClosed : N.defaultOption
  framingClosed : N.framing
  salienceClosed : N.salience
  commitmentClosed : N.commitment

def NudgingClosed (N : NudgingPackage) : Prop :=
  N.choiceArchitecture ∧ N.defaultOption ∧ N.framing ∧ N.salience ∧ N.commitment

theorem nudging_closed_from_evidence (N : NudgingPackage) (E : NudgingEvidence N) :
    NudgingClosed N := by
  exact And.intro E.choiceArchitectureClosed (And.intro E.defaultOptionClosed (And.intro E.framingClosed (And.intro E.salienceClosed E.commitmentClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse