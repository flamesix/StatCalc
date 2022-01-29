//
//  ViewController.swift
//  Calculator
//
//  Created by Юрий Гриневич on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var inputedNumber: String = ""
    var isFinishedNumber: Bool = true
    var decimalPoint = 5
    var numOne = 0.0
    var numTwo = 0.0
    var numThree = 0.0
    var numFour = 0.0
    var numFive = 0.0
    var meanValue = 0.0
    var srelValue = 0.0
    var realValue = 0.0
    var numItems = 0.0
    var sumOfSquares = 0.0
    
    @IBOutlet weak var numberOne: UILabel!
    @IBOutlet weak var numberTwo: UILabel!
    @IBOutlet weak var numberThree: UILabel!
    @IBOutlet weak var numberFour: UILabel!
    @IBOutlet weak var numberFive: UILabel!
    @IBOutlet weak var resultScreen: UILabel!
    @IBOutlet weak var decimalValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numpadPressed(_ sender: UIButton) {
        
        if let number = sender.currentTitle {
            
            if isFinishedNumber {
                resultScreen.text = number
                isFinishedNumber = false
            } else {
                resultScreen.text = resultScreen.text! + number
                
            }
        }
    }
    
    
    @IBAction func srelButtonPressed(_ sender: UIButton) {
        
        statistic()
        
    }
    
    func statistic() {
        mean()
        
        if numFive == 0, numFour == 0, numThree == 0, numTwo == 0 {
            sumOfSquares = pow((numOne - meanValue), 2)
        } else if numFive == 0, numFour == 0, numThree == 0 {
            sumOfSquares = pow((numOne - meanValue), 2) + pow((numTwo - meanValue), 2)
        } else if numFive == 0, numFour == 0 {
            sumOfSquares = pow((numOne - meanValue), 2) + pow((numTwo - meanValue), 2) + pow((numThree - meanValue), 2)
        }else if numFive == 0 {
            sumOfSquares = pow((numOne - meanValue), 2) + pow((numTwo - meanValue), 2) + pow((numThree - meanValue), 2) + pow((numFour - meanValue), 2)
        }
        
        srelValue = (1 / meanValue) * sqrt((sumOfSquares)/(numItems - 1)) * 100
        realValue = sqrt((sumOfSquares)/(numItems - 1))
        
        resultScreen.text = "ОСКО: \(String(format: "%.\(decimalPoint)f", srelValue)) %"
    }
    
    func mean() {
        meanValue = (numOne + numTwo + numThree + numFour + numFive) / numItems
    }
    
    @IBAction func meanButtonPressed(_ sender: UIButton) {
        
        mean()
        
        resultScreen.text = "Среднее: \(String(format: "%.\(decimalPoint)f", meanValue))"
        
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
        
        
        if numberOne.text == "" {
            numberOne.text = resultScreen.text
            resultScreen.text = "0"
            numOne = Double(numberOne.text!) ?? 0
            numItems += 1
            isFinishedNumber = true
            
        } else if numberOne.text != "" && numberTwo.text == ""{
            numberTwo.text = resultScreen.text
            resultScreen.text = "0"
            numTwo = Double(numberTwo.text!) ?? 0
            numItems += 1
            isFinishedNumber = true
            
        } else if numberOne.text != "" && numberTwo.text != "" && numberThree.text == "" {
            numberThree.text = resultScreen.text
            resultScreen.text = "0"
            numThree = Double(numberThree.text!) ?? 0
            numItems += 1
            isFinishedNumber = true
            
        } else if numberOne.text != "" && numberTwo.text != "" && numberThree.text != "" && numberFour.text == ""{
            numberFour.text = resultScreen.text
            resultScreen.text = "0"
            numFour = Double(numberFour.text!) ?? 0
            numItems += 1
            isFinishedNumber = true
            
        } else if numberOne.text != "" && numberTwo.text != "" && numberThree.text != "" && numberFour.text != "" && numberFive.text == "" {
            numberFive.text = resultScreen.text
            resultScreen.text = "0"
            numFive = Double(numberFive.text!) ?? 0
            numItems += 1
            isFinishedNumber = true
        }
    }
    
    @IBAction func acButtonPressed(_ sender: UIButton) {
        
        if numberOne.text != "" && numberTwo.text != "" && numberThree.text != "" && numberFour.text != "" && numberFive.text != "" {
            numberFive.text = ""
            numFive = 0
            numItems -= 1
        } else if numberOne.text != "" && numberTwo.text != "" && numberThree.text != "" && numberFour.text != ""{
            numberFour.text = ""
            numFour = 0
            numItems -= 1
        } else if numberOne.text != "" && numberTwo.text != "" && numberThree.text != "" {
            numberThree.text = ""
            numThree = 0
            numItems -= 1
        } else if numberOne.text != "" && numberTwo.text != ""{
            numberTwo.text = ""
            numTwo = 0
            numItems -= 1
        } else if numberOne.text != "" {
            numberOne.text = ""
            numOne = 0
            numItems -= 1
        }
        
    }
    @IBAction func decimalPicker(_ sender: UISlider) {
       
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        decimalPoint = Int(sender.value)
        decimalValueLabel.text = String(decimalPoint)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.mean = "Среднее: \(String(format: "%.\(decimalPoint)f", meanValue))"
            destinationVC.srel = "ОСКО: \(String(format: "%.\(decimalPoint)f", srelValue)) %"
            destinationVC.real = "СКО: \(String(format: "%.\(decimalPoint)f", realValue))"
        }
        
    }
    
}
