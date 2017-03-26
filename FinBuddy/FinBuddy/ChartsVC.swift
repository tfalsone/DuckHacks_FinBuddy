//
//  ChartsVC.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/26/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import Charts

class ChartsVC: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let categories = ["Food", "Living", "Savings"]
        let myValues:[Int] = [myData.percFood, myData.percLiving, myData.percSavings]
        
        setChart(dataPoints: categories, values: myValues)
    }
    
    func setChart(dataPoints: [String], values: [Int]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(values[i]), y: Double(i))
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Percent Budget")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        self.pieChart.data = pieChartData
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    } */

}
