//
//  ViewController.swift
//  BillSplitter
//
//  Created by Kostadin Samardzhiev on 24.12.21.
//

import UIKit

class SplitBillViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    var splitBillBrain = SplitBillBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSegmentUI()
        splitBillBrain.setTipIndex(segmentControl.selectedSegmentIndex)
        splitBillBrain.setPeopleCount(Double(numberOfPeopleLabel.text!)!)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func segmentChaged(_ sender: UISegmentedControl) {
        splitBillBrain.setTipIndex(sender.selectedSegmentIndex)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitBillBrain.setPeopleCount(sender.value)
        numberOfPeopleLabel.text = String(format: "%.0f", sender.value)
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        splitBillBrain.splitBill(bill: Double(textField.text!)!)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func prepareSegmentUI() {
        let titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .regular)
        ]
        segmentControl.setTitleTextAttributes(titleTextAttributes, for:.selected)
        
        let titleTextAttributes1 = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .regular)
        ]
        segmentControl.setTitleTextAttributes(titleTextAttributes1, for:.normal)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.tip = splitBillBrain.getTip()
            resultVC.result = splitBillBrain.getSplittedBill()
            resultVC.people = splitBillBrain.getPeopleCount()
        }
    }

}

