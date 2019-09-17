import Foundation

extension Int {
  func isPrime() -> Bool {
    let PRIME_ACCURACY = 10
    
    guard(self > 1) else {
      return false
    }
    guard(self > 3) else {
      return true
    }
    guard(self % 2 == 1) else {
      return false
    }

    let (deconstructedBase, powerOf2) = deconstructNumber()
    
    return hasPrimeWitnesses(accuracy: PRIME_ACCURACY, 
                             base: deconstructedBase, 
                             powerOf2: powerOf2)
  }
  

  func calculateNewComposite(base: Int, powerOf2: Int) -> (Int, Int) {
    return ( base << 1, powerOf2+1 )
  }

  func deconstructNumber() -> (Int, Int) {
    var powerOf2 = 0
    var base = self - 1

    for _ in 0...Int(sqrt(Double(self))) {
      if(base & 1 != 0) {
        return (base, powerOf2)
      } else {
        (base, powerOf2) = calculateNewComposite(base: base, powerOf2: powerOf2)
      }
    }
    return (base, powerOf2)
  }

  func modularExponentation(base: Int, exponent: Int) -> Int {
    var n = 1

    for _ in 1...exponent {
      n = (n * base) % self
    }
    return n
  }

  func passesWitnessTest1(_ witness: Int, exponent: Int) -> Bool {
    let n = modularExponentation(base: witness, exponent: exponent)

    return (n == 1 || n == self - 1)
  }

  func passesWitnessTest2(_ witness: Int, deconstructedBase: Int, 
                    powerOf2: Int) -> Bool {
    var n = modularExponentation(base: witness, exponent: deconstructedBase)

    for _ in 1..<powerOf2 {
      n = modularExponentation(base: n, exponent: 2)

      if(n == self - 1) {
        return true
      }
    }
    return false
  }

  func hasPrimeWitnesses(accuracy: Int, base: Int, powerOf2: Int) -> Bool {
    for _ in 0...accuracy {
      let witness = Int.random(in: 2..<(self - 1))
                            
      if(passesWitnessTest1(witness, exponent: base) || 
         passesWitnessTest2(witness, 
                            deconstructedBase: base, 
                            powerOf2: powerOf2)) {
                              continue
      }
      return false
    }
    return true
  }

}