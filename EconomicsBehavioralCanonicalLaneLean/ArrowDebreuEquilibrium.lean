import EconomicsBehavioralCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure ArrowDebreuEquilibriumPackage where
  commoditySpace : Type u
  priceSystem : Type v
  agentEndowments : Prop
  utilityMaximization : Prop
  marketClearance : Prop
  walrasLaw : Prop
  equilibriumExistence : Prop

structure ArrowDebreuEvidence (E : ArrowDebreuEquilibriumPackage) where
  agentEndowmentsClosed : E.agentEndowments
  utilityMaximizationClosed : E.utilityMaximization
  marketClearanceClosed : E.marketClearance
  walrasLawClosed : E.walrasLaw
  equilibriumExistenceClosed : E.equilibriumExistence

def ArrowDebreuEquilibriumClosed (E : ArrowDebreuEquilibriumPackage) : Prop :=
  E.agentEndowments ∧ E.utilityMaximization ∧ E.marketClearance ∧ E.walrasLaw ∧ E.equilibriumExistence

theorem arrow_debreu_equilibrium_closed_from_evidence
    (E : ArrowDebreuEquilibriumPackage) (Ev : ArrowDebreuEvidence E) :
    ArrowDebreuEquilibriumClosed E := by
  exact And.intro Ev.agentEndowmentsClosed
    (And.intro Ev.utilityMaximizationClosed
      (And.intro Ev.marketClearanceClosed
        (And.intro Ev.walrasLawClosed Ev.equilibriumExistenceClosed)))

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse