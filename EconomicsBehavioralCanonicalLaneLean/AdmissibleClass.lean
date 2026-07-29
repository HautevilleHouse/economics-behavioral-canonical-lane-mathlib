import EconomicsBehavioralCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure AdmissibleClass where
  object : EconomicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EconomicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse