//
//  MonthBudgetVC.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/25/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

extension UIProgressView {
    
    func animate(start: Float, duration: Double, delay:Double, progress: Float) {
        
        setProgress(start, animated: true)
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveLinear, animations: {
            self.setProgress(progress, animated: true)
        }, completion: nil)
    }
}

class MonthBudgetVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var pb_progress: UIProgressView!
    @IBOutlet weak var l_budgetFor: UILabel!
    @IBOutlet weak var i_budget: UITextField!
    @IBOutlet weak var l_dollar: UILabel!
    @IBOutlet weak var b_next: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pb_progress.alpha = 0
        self.l_budgetFor.alpha = 0
        self.l_dollar.alpha = 0
        self.i_budget.alpha = 0
        self.b_next.alpha = 0
        
        self.b_next.layer.cornerRadius = 50
        self.b_next.layer.shadowColor = UIColor.black.cgColor
        self.b_next.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.b_next.layer.shadowRadius = 3
        self.b_next.layer.shadowOpacity = 0.5
        
        self.pb_progress.transform = self.pb_progress.transform.scaledBy(x: 1, y: 10)
        
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let dateFormatter: DateFormatter = DateFormatter()
        let months = dateFormatter.monthSymbols
        let monthSymbol = months![month-1]
        self.l_budgetFor.text = self.l_budgetFor.text! + " \(monthSymbol)"
        
        var frameRect:CGRect = i_budget.frame
        frameRect.size.height = 40
        i_budget.frame = frameRect
        
        self.i_budget.returnKeyType = UIReturnKeyType.done
        self.i_budget.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_budget.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_budget.delegate = self
        self.i_budget.borderStyle = UITextBorderStyle.none
        self.i_budget.layer.addSublayer(self.getBorder(self.i_budget))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fadeInBudget()
    }
    
    func fadeInBudget() -> Void {
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       options: .curveEaseIn,
                       animations: {
                        self.pb_progress.alpha = 1
        },
                       completion: { finished in
                        self.pb_progress.animate(start: myData.currProgBar, duration: 1, delay: 0.0, progress: 0.33)
                        myData.currProgBar = 0.33
                        self.fadeInInputArea()
        })
    }
    
    func fadeInInputArea() -> Void {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
                        self.l_dollar.alpha = 1
                        self.l_budgetFor.alpha = 1
                        self.i_budget.alpha = 1
        },
                       completion: { finished in
                        self.fadeInButton()
        })
    }
    
    func fadeInButton() -> Void {
        UIView.animate(withDuration: 0.75,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
                        self.b_next.alpha = 1
        },
                       completion: { finished in
                        print("Done")
        })
    }
    
    func getBorder(_ textInput:UITextField) -> CALayer
    {
        let border = CALayer()                  //the bottom line under the input
        let bwidth = CGFloat(2.0)
        border.borderColor = UIColor(red:0.11, green:0.37, blue:0.13, alpha:1.0).cgColor
        border.frame = CGRect(x: 0, y: textInput.frame.size.height - bwidth, width: textInput.frame.size.width, height: 2)//textInput.frame.size.height)
        border.borderWidth = bwidth
        
        return border
    }
    
    @IBAction func tapReceived(_ sender: Any) {
        self.view.endEditing(true)
    }
        
    @IBAction func nextTapped(_ sender: Any) {
        myData.totalBudget = Float(self.i_budget.text!)!
        
        print("Next tapped")
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "LivingExpenses")
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
