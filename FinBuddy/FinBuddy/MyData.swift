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
    
    func fillPercLiving() {
        percLiving = Int(totalBudget / (rent + electric + water + cable + school))
    }
    
    func fillPercSavings() {
        var diff = 
    }
}

var myData = allMyData()
