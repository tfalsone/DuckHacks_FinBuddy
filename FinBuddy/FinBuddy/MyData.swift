//
//  MyData.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/26/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import Foundation

struct allMyData {
    var totalBudget:Float = 0
    
    var rent:Float = 0
    var electric:Float = 0
    var water:Float = 0
    var cable:Float = 0
    var school:Float = 0
    var totalLiving:Float = 0
    var percLiving:Int = 0
    
    var percSavings:Int = 0
    var percFood:Int = 0
    
    var assessment:String = ""
    
    mutating func fillPercLiving() {
        totalLiving = rent + electric + water + cable + school
        percLiving = Int(totalLiving * 100 / totalBudget)
    }
    
    mutating func fillPercSavings() {
        let diff:Int = (50 - percLiving)/2
        percSavings = 20 + diff
    }
    
    mutating func fillPercFood() {
        percFood = 100 - percLiving - percSavings
        if percLiving > 50 {
            assessment = "Looks like you spend more on living than the average person."
        } else if percLiving == 50 {
            assessment = "Looks like you are right with the average in terms of the amound you spend on living."
        } else {
            assessment = "Looks like you spend less on living than the average person."
        }
        
        assessment += " The amount of money allocated for food and savings have been adjusted accordingly."
    }
}

var myData = allMyData()
