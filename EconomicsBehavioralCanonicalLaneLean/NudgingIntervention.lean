import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure NudgingInterventionPackage where
  choiceEnvironment : Type u
  defaultOption : choiceEnvironment
  nudgeAction : choiceEnvironment → choiceEnvironment
  outcomeMeasure : choiceEnvironment → ℝ
  rationalityAssumption : Prop
  nudgeEffective : Prop
  welfareImproving : Prop

structure NudgingInterventionEvidence (N : NudgingInterventionPackage) where
  nudgeEffectiveClosed : N.nudgeEffective
  welfareImprovingClosed : N.welfareImproving
  rationalityAssumptionClosed : N.rationalityAssumption

def NudgingInterventionClosed (N : NudgingInterventionPackage) : Prop :=
  N.nudgeEffective ∧ N.welfareImproving ∧ N.rationalityAssumption

theorem nudging_intervention_closed_from_evidence (N : NudgingInterventionPackage)
    (Ev : NudgingInterventionEvidence N) : NudgingInterventionClosed N := by
  exact And.intro Ev.nudgeEffectiveClosed
    (And.intro Ev.welfareImprovingClosed Ev.rationalityAssumptionClosed)

end HautevilleHouse
end EconomicsBehavioralCanonicalLaneLean
