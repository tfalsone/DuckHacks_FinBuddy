//
//  MyData.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/26/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import Foundation

struct allMyData {
    var totalBudget:Float = 2000
    
    var rent:Float = 100
    var electric:Float = 100
    var water:Float = 100
    var cable:Float = 200
    var school:Float = 400
    var totalLiving:Float = 900
    var percLiving:Int = 45
    
    var percSavings:Int = 22
    var percFood:Int = 33
    
    var assessment:String = ""
    
    var currProgBar:Float = 0.01
    
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
