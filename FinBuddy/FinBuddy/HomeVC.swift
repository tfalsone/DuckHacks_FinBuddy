//
//  HomeVC.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/25/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var b_comparison: UIButton!
    @IBOutlet weak var b_charts: UIButton!
    @IBOutlet weak var b_edit: UIButton!
    @IBOutlet weak var b_login: UIButton!
    @IBOutlet weak var l_budget: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let b_num = myData.totalBudget as NSNumber
        let b_dollar = formatter.string(from: b_num)
        
        self.l_budget.text = b_dollar
        
        self.b_comparison.layer.cornerRadius = self.b_comparison.frame.height / 2
        self.b_comparison.layer.shadowColor = UIColor.black.cgColor
        self.b_comparison.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.b_comparison.layer.shadowRadius = 3
        self.b_comparison.layer.shadowOpacity = 0.5
        
        self.b_charts.layer.cornerRadius = self.b_comparison.frame.height / 2
        self.b_charts.layer.shadowColor = UIColor.black.cgColor
        self.b_charts.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.b_charts.layer.shadowRadius = 3
        self.b_charts.layer.shadowOpacity = 0.5
        
        self.b_edit.layer.cornerRadius = self.b_comparison.frame.height / 2
        self.b_edit.layer.shadowColor = UIColor.black.cgColor
        self.b_edit.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.b_edit.layer.shadowRadius = 3
        self.b_edit.layer.shadowOpacity = 0.5
        
        self.b_login.layer.cornerRadius = self.b_comparison.frame.height / 2
        self.b_login.layer.shadowColor = UIColor.black.cgColor
        self.b_login.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.b_login.layer.shadowRadius = 3
        self.b_login.layer.shadowOpacity = 0.5

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
        
        
        // instead of using the default transition animation, we'll ask
        // the segue to use our custom TransitionManager object to manage the transition animation
        
    } */

}
