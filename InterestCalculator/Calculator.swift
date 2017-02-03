//
//  Calculator.swift
//  InterestCalculator
//
//  Created by Bradley Reed on 01/02/2017.
//  Copyright © 2017 Bradley Reed. All rights reserved.
//

import Foundation

struct Calculator {
    
    /// The amount of money initially borrowed (£)
    var borrowed = 0.0
    
    /// The interest rate, %
    var interestRate = 0.0
    
    /// Length of the loan in years
    var loanLengthYears = 0.0

    /// Returns the interest rate percentage as a decimal in the range 0-1
    var interestRateDecimal: Double {
        return interestRate / 100
    }
    
    /**
     * Returns the total payable, interest + original borrow amount
     */
    var totalPayable: Double {
        // If the loan length is not set, there is no loan, so the amount payable is the amount borrowed
        if loanLengthYears > 0 {
            // Using compund interest formula
            return borrowed * pow(1.0 + interestRateDecimal, loanLengthYears)
        } else {
            return borrowed
        }
    }
    
    /**
     * Returns the amount payable per year
     * If the loan length is 0, this returns 0, as division by zero doesn't work
     */
    var totalPayableAnnually: Double {
        if loanLengthYears > 0 {
            return (totalPayable - borrowed) / loanLengthYears
        } else {
            return 0.0
        }
    }
    
    /**
     * Returns the total amount payable per month
     */
    var totalPayableMonthly: Double {
        return totalPayableAnnually / 12
    }
}
