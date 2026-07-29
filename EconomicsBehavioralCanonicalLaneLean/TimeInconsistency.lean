import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.ProspectTheory

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure TimeInconsistencyPackage where
  hyperbolicDiscounting : Prop
  presentBias : Prop
  quasiHyperbolicBetaDelta : Prop
  naiveteSophistication : Prop
  commitmentDevice : Prop

structure TimeInconsistencyEvidence (T : TimeInconsistencyPackage) where
  hyperbolicDiscountingClosed : T.hyperbolicDiscounting
  presentBiasClosed : T.presentBias
  quasiHyperbolicBetaDeltaClosed : T.quasiHyperbolicBetaDelta
  naiveteSophisticationClosed : T.naiveteSophistication
  commitmentDeviceClosed : T.commitmentDevice

def TimeInconsistencyClosed (T : TimeInconsistencyPackage) : Prop :=
  T.hyperbolicDiscounting ∧ T.presentBias ∧ T.quasiHyperbolicBetaDelta ∧ T.naiveteSophistication ∧ T.commitmentDevice

theorem time_inconsistency_closed_from_evidence (T : TimeInconsistencyPackage) (E : TimeInconsistencyEvidence T) :
    TimeInconsistencyClosed T := by
  exact And.intro E.hyperbolicDiscountingClosed (And.intro E.presentBiasClosed (And.intro E.quasiHyperbolicBetaDeltaClosed (And.intro E.naiveteSophisticationClosed E.commitmentDeviceClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse