//
//  ComparisonVC.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/26/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class ComparisonVC: UIViewController {
    @IBOutlet weak var s_living: UISlider!
    @IBOutlet weak var s_food: UISlider!
    @IBOutlet weak var s_savings: UISlider!
    @IBOutlet weak var l_living: UILabel!
    @IBOutlet weak var l_food: UILabel!
    @IBOutlet weak var l_savings: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.s_living.value = Float(myData.percLiving)
        self.l_living.text = "\(myData.percLiving)%"
        self.s_food.value = Float(myData.percFood)
        self.l_food.text = "\(myData.percFood)%"
        self.s_savings.value = Float(myData.percSavings)
        self.l_savings.text = "\(myData.percSavings)%"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }*/

}
