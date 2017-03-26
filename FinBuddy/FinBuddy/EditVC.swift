//
//  EditVC.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/26/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import Alamofire

class EditVC: UIViewController {
    @IBOutlet weak var b_home: UIButton!
    @IBOutlet weak var s_food: UISlider!
    @IBOutlet weak var l_foodPerc: UILabel!
    @IBOutlet weak var l_foodDollar: UILabel!
    @IBOutlet weak var s_savings: UISlider!
    @IBOutlet weak var l_savingsPerc: UILabel!
    @IBOutlet weak var l_savingsDollar: UILabel!
    @IBOutlet weak var b_submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        b_submit.layer.cornerRadius = 10
        
        s_food.maximumValue = Float(myData.percFood + myData.percSavings)
        print(s_food.maximumValue)
        s_food.minimumValue = 0
        s_savings.maximumValue = s_food.maximumValue
        s_food.minimumValue = 0
        
        s_food.value = Float(myData.percFood)
        s_savings.value = Float(myData.percSavings)
        l_foodPerc.text = "\(myData.percFood)%"
        l_savingsPerc.text = "\(myData.percSavings)%"
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        var dollar:Float = (myData.totalBudget / 100.0) * Float(myData.percFood)
        var num = dollar as NSNumber
        let f_dollar = formatter.string(from: num)
        dollar = (myData.totalBudget / 100.0) * Float(myData.percSavings)
        num = dollar as NSNumber
        let s_dollar = formatter.string(from: num)
        
        l_foodDollar.text = f_dollar
        l_savingsDollar.text = s_dollar

        // Do any additional setup after loading the view.
    }

    @IBAction func foodSliderChange(_ sender: UISlider) {
        var newVal:Int = Int(sender.value)
        
        if newVal > Int(s_food.maximumValue - 5) {
            newVal = Int(s_food.maximumValue - 5)
        } else if newVal < 5{
            newVal = 5
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        var dollar:Float = (myData.totalBudget / 100.0) * Float(newVal)
        let f_num = dollar as NSNumber
        let f_dollar = formatter.string(from: f_num)
        
        self.s_food.value = Float(newVal)
        self.l_foodPerc.text = "\(newVal)%"
        self.l_foodDollar.text = f_dollar
        
        dollar = (myData.totalBudget / 100.0) * (s_food.maximumValue - Float(newVal))
        let s_num = dollar as NSNumber
        let s_dollar = formatter.string(from: s_num)
        
        self.s_savings.value = s_food.maximumValue - Float(newVal)
        self.l_savingsPerc.text = "\(Int(self.s_savings.value))%"
        self.l_savingsDollar.text = s_dollar
    }
    
    @IBAction func savingsSliderChange(_ sender: UISlider) {
        var newVal:Int = Int(sender.value)
        
        if newVal > Int(s_savings.maximumValue - 5) {
            newVal = Int(s_savings.maximumValue - 5)
        } else if newVal < 5{
            newVal = 5
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        var dollar:Float = (myData.totalBudget / 100.0) * Float(newVal)
        let s_num = dollar as NSNumber
        let s_dollar = formatter.string(from: s_num)
        
        self.s_savings.value = Float(newVal)
        self.l_savingsPerc.text = "\(newVal)%"
        self.l_savingsDollar.text = s_dollar
        
        dollar = (myData.totalBudget / 100.0) * (s_savings.maximumValue - Float(newVal))
        let f_num = dollar as NSNumber
        let f_dollar = formatter.string(from: f_num)
        
        self.s_food.value = s_savings.maximumValue - Float(newVal)
        self.l_foodPerc.text = "\(Int(self.s_food.value))%"
        self.l_foodDollar.text = f_dollar
    }

    @IBAction func submit(_ sender: Any) {
        myData.percFood = Int(s_food.value)
        myData.percSavings = Int(s_savings.value)
        
        let budgetInfo = [
            "income_monthly": myData.totalBudget,
            "food_perc": myData.percFood,
            "living_perc": myData.percLiving,
            "savings_perc": myData.percSavings
            ] as [String : Any]
        
        Alamofire.request(url + "/budget_data/" + myData.userId, method: .put, parameters: budgetInfo, encoding: JSONEncoding.default).responseJSON {
            response in
            
            debugPrint(response) }
        
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "HomeVC")
        self.present(nextViewController, animated:true, completion:nil)
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
