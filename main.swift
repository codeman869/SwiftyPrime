import XCTest

XCTMain([testCase(PrimeTests.allTests)])

func getPrimes(from start: Int, to end: Int) -> [Int] {
  var retVal: [Int] = []

  if(start < end) {
    for i in start...end {

    if(i.isPrime()) {
      retVal.append(i)
    }

    }

  } else {
    for i in end...start {

    if(i.isPrime()) {
      retVal.append(i)
    }
  }

  }
  

  return retVal
}