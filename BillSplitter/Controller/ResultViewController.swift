//
//  ResultViewController.swift
//  BillSplitter
//
//  Created by Kostadin Samardzhiev on 25.12.21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var result = 0.0
    var tip = 0
    var people = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(format: "%.2f", result)
        descriptionLabel.text = "Split between \(people) people, with \(tip)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
