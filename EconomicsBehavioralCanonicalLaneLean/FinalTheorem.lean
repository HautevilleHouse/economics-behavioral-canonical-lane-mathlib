import EconomicsBehavioralCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

def ConstrainedEconomicsBehavioralClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_economics_behavioral_endgame (A : AdmissibleClass) :
    ConstrainedEconomicsBehavioralClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse