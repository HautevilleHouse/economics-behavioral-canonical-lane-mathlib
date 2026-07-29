import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsBehavioralCanonicalLaneLean

structure BehavioralTheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  behavioralConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : BehavioralTheoremStatement := {
  sourceKey := "economics-behavioral-canonical-lane",
  theoremName := "EconomicsBehavioral",
  theoremObject := "Behavioral equilibrium existence under bounded rationality",
  classicalBoundary := "All classical rationality assumptions are relaxed",
  behavioralConstrainedStatement := "Behaviorally-constrained theorem certificate internalized through admissible closure",
  certificateLane := "behavioral_constrained",
  carriedRemainder := "Classical rationality boundary carried by the unrestricted model"
}

end EconomicsBehavioralCanonicalLaneLean
end HautevilleHouse