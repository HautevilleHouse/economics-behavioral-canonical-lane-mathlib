import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure PrimitiveChoiceSpace where
  alternatives : Type u
  preferenceRelation : alternatives → alternatives → Prop
  rationalPreference : Prop
  completeness : ∀ x y : alternatives, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z : alternatives, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z

structure PrimitiveUtilityFunction (C : PrimitiveChoiceSpace) where
  utility : C.alternatives → ℝ
  representsPreference : ∀ x y : C.alternatives, C.preferenceRelation x y ↔ utility x ≥ utility y

structure PrimitiveBudgetSet (wealth : ℝ) (prices : List ℝ) where
  affordable : { (x : List ℝ) // wealth ≥ ∑ i in (List.range prices.length).toFinset, prices.get i * x.get i }

structure PrimitiveConsumerProblem (C : PrimitiveChoiceSpace) (U : PrimitiveUtilityFunction C) where
  budget : PrimitiveBudgetSet 100.0 [1.0, 2.0]
  utilityFunction : C.alternatives → ℝ := U.utility
  optimalChoice : C.alternatives := by
    choose x hx using Finset.max'_mem (Finset.image U.utility budget.affordable) (by
      apply Finset.image_nonempty.mpr
      exact ⟨budget.affordable.1, budget.affordable.2⟩)
    exact x
  maximization : U.utility optimalChoice = Finset.max' (Finset.image U.utility budget.affordable) (by
    apply Finset.image_nonempty.mpr
    exact ⟨budget.affordable.1, budget.affordable.2⟩)

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse