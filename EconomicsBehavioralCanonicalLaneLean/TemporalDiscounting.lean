import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure DiscountingPackage where
  timeHorizon : Type u
  utilityStream : Type v
  discountFactor : Type w
  presentBias : Prop
  hyperbolicDiscount : Prop
  timeConsistency : Prop
  instantaneousUtility : Prop
  discountFactorPositive : Prop

structure DiscountingEvidence (D : DiscountingPackage) where
  presentBiasClosed : D.presentBias
  hyperbolicDiscountClosed : D.hyperbolicDiscount
  timeConsistencyClosed : D.timeConsistency
  instantaneousUtilityClosed : D.instantaneousUtility
  discountFactorPositiveClosed : D.discountFactorPositive

def DiscountingClosed (D : DiscountingPackage) : Prop :=
  D.presentBias ∧ D.hyperbolicDiscount ∧ D.timeConsistency ∧ D.instantaneousUtility ∧ D.discountFactorPositive

theorem discounting_closed_from_evidence (D : DiscountingPackage) (E : DiscountingEvidence D) : DiscountingClosed D := by
  exact And.intro E.presentBiasClosed
    (And.intro E.hyperbolicDiscountClosed
      (And.intro E.timeConsistencyClosed
        (And.intro E.instantaneousUtilityClosed E.discountFactorPositiveClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse
