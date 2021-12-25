//
//  ViewController.swift
//  BillSplitter
//
//  Created by Kostadin Samardzhiev on 24.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSegmentUI()
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


}

