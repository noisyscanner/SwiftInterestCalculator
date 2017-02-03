//
//  ViewController.swift
//  InterestCalculator
//
//  Created by Bradley Reed on 01/02/2017.
//  Copyright © 2017 Bradley Reed. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {

    // Input fields
    @IBOutlet weak var txtAmountToBorrow: NSTextField!
    @IBOutlet weak var txtIntetestRate: NSTextField!
    @IBOutlet weak var txtLoanLength: NSTextField!
    
    // Output labels used to display the result
    @IBOutlet weak var lblMonthlyInterest: NSTextField!
    @IBOutlet weak var lblTotalInterest: NSTextField!
    
    // To format the results into a proper currency string, eg. £123,456,789.69
    let currencyFormatter = NumberFormatter()
    
    // Calculator struct used to store the user's input and calculate the result
    var calculator = Calculator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up currency formatter for £pounds
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "en_GB")
        
        // Set text fields to default values
        txtAmountToBorrow.doubleValue = calculator.borrowed
        txtIntetestRate.doubleValue = calculator.interestRate
        txtLoanLength.doubleValue = calculator.loanLengthYears
    }
    
    override func controlTextDidChange(_ obj: Notification) {
        // Text in input changed, update interest
        calculator.borrowed = txtAmountToBorrow.doubleValue
        calculator.interestRate = txtIntetestRate.doubleValue
        calculator.loanLengthYears = txtLoanLength.doubleValue
        
        lblTotalInterest.stringValue = currencyFormatter.string(from: calculator.totalPayable as NSNumber) ?? ""
        lblMonthlyInterest.stringValue = currencyFormatter.string(from: calculator.totalPayableMonthly as NSNumber) ?? ""
    }
}

