//
//  SplitBillBrain.swift
//  BillSplitter
//
//  Created by Kostadin Samardzhiev on 25.12.21.
//

import Foundation

struct SplitBillBrain {
    
    var people = 0.0
    var tipIndex = 0
    var splittedBill = 0.0
    
    mutating func splitBill(bill: Double) {
        splittedBill = (bill + (resolveTipFromIndex()*bill)) / people
    }
    
    func resolveTipFromIndex() -> Double {
        switch tipIndex {
        case 0: return 0
        case 1: return 0.1
        case 2: return 0.15
        case 3: return 0.20
        default:
            return 0.05
        }
    }
    
    mutating func setPeopleCount(_ people: Double) {
        self.people = people
    }
    
    mutating func setTipIndex(_ index: Int) {
        self.tipIndex = index
    }
    
    func getTip() -> Int {
        return Int(resolveTipFromIndex()*100)
    }
    
    func getSplittedBill() -> Double {
        return splittedBill
    }
    
    func getPeopleCount() -> Int {
        return Int(people)
    }
}
