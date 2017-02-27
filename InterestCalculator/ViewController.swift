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
    @IBOutlet weak var amountToBorrowTextField: NSTextField!
    @IBOutlet weak var interestRateTextField: NSTextField!
    @IBOutlet weak var loanLengthTextField: NSTextField!
    
    
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
        
        // Set text fields to default values, zeroes
        amountToBorrowTextField.doubleValue = calculator.borrowed
        interestRateTextField.doubleValue = calculator.interestRate
        loanLengthTextField.doubleValue = calculator.loanLengthYears
    }
    
    override func controlTextDidChange(_ notification: Notification) {
        // Text in input changed, update interest label in UI
        switch notification.object as! NSTextField {
        case amountToBorrowTextField:
            // Borrowed amount field changed
            calculator.borrowed = amountToBorrowTextField.doubleValue
        case interestRateTextField:
            // Interest rate field changed
            calculator.interestRate = interestRateTextField.doubleValue
        default:
            // Loan length field changed
            calculator.loanLengthYears = loanLengthTextField.doubleValue
        }
        
        // Updates the UI with the new values
        recalculate()
    }
    
    /// Re-calculates the total and monthly interest payments 
    /// using the calculator, and displays in the UI
    private func recalculate() {
        lblTotalInterest.stringValue = currencyFormatter.string(
            from: calculator.totalPayable as NSNumber) ?? ""
        
        lblMonthlyInterest.stringValue = currencyFormatter.string(
            from: calculator.totalPayableMonthly as NSNumber) ?? ""
    }
}

