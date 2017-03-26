//
//  MyData.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/26/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import Foundation

struct allMyData {
    var userId:String = ""
    var name:String = ""
    
    var totalBudget:Float = 2000
    
    var rent:Float = 100
    var percRent:Int = 5
    var electric:Float = 100
    var percElectric:Int = 5
    var water:Float = 100
    var percWater:Int = 5
    var cable:Float = 200
    var percCable:Int = 5
    var school:Float = 400
    var percSchool:Int = 5
    var totalLiving:Float = 900
    var percLiving:Int = 45
    
    var percSavings:Int = 22
    var percFood:Int = 33
    
    var toSavePerc:Int = 50
    var toBuyPerc:Int = 50
    
    var groceriesPerc:Int = 50
    var eatOutPerc:Int = 25
    var socialPerc:Int = 25
    
    struct monthlySaving {
        var savingId:Int
        var amntSave:Float
        var monthYr:String
        var amntMade:Float
        var amntSpent:Float
    }
    
    var allMonthSaving = [monthlySaving]()
    
    var assessment:String = ""
    
    var currProgBar:Float = 0.01
    
    mutating func getPercExpenses() {
        percRent = Int(rent * 100 / totalLiving)
        percElectric = Int(electric * 100 / totalLiving)
        percWater = Int(water * 100 / totalLiving)
        percCable = Int(cable * 100 / totalLiving)
        percSchool = Int(school * 100 / totalLiving)
    }
    
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

var url:String = "http://155.246.213.64:3000"

var myData = allMyData()
