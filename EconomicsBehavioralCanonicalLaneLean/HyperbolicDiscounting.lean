import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure HyperbolicDiscountingPackage where
  timePeriods : Type u
  discountFactor : ℝ → ℝ
  longRunDiscount : ℝ
  shortRunDiscount : ℝ
  hyperbolicParameter : ℝ
  discountFunction : timePeriods → ℝ

structure HyperbolicDiscountingEvidence (H : HyperbolicDiscountingPackage) where
  discountFunctionConsistent : ∀ t : H.timePeriods, H.discountFunction t = H.discountFactor (H.hyperbolicParameter * (1 : ℝ))
  shortRunGreaterThanLongRun : H.shortRunDiscount > H.longRunDiscount

def HyperbolicDiscountingClosed (H : HyperbolicDiscountingPackage) : Prop :=
  (∀ t : H.timePeriods, H.discountFunction t = H.discountFactor (H.hyperbolicParameter * (1 : ℝ))) ∧
  H.shortRunDiscount > H.longRunDiscount

theorem hyperbolic_discounting_closed_from_evidence (H : HyperbolicDiscountingPackage)
    (Ev : HyperbolicDiscountingEvidence H) : HyperbolicDiscountingClosed H := by
  exact And.intro Ev.discountFunctionConsistent Ev.shortRunGreaterThanLongRun

end HautevilleHouse
end EconomicsBehavioralCanonicalLaneLean
