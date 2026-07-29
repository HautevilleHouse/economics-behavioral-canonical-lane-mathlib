import HautevilleHouse.EconomicsBehavioralCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure EconomicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EconomicsAdmittedObject where
  space : EconomicsSpace
  behavioralAssumptions : Prop
  equilibriumExists : Prop
  welfareModel : Type
  welfareTopology : TopologicalSpace welfareModel
  paretoOptimal : Prop
  conclusion : paretoOptimal

structure EconomicsEndgameState where
  object : EconomicsAdmittedObject

def EconomicsWitnessClosed (O : EconomicsAdmittedObject) : Prop :=
  O.paretoOptimal

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse