//
//  LivingExpensesVC.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/25/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class LivingExpensesVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var i_rent: UITextField!
    @IBOutlet weak var i_electric: UITextField!
    @IBOutlet weak var i_water: UITextField!
    @IBOutlet weak var i_cable: UITextField!
    @IBOutlet weak var i_school: UITextField!
    @IBOutlet weak var b_next: UIButton!
    @IBOutlet weak var l_rent: UILabel!
    @IBOutlet weak var l_electric: UILabel!
    @IBOutlet weak var l_water: UILabel!
    @IBOutlet weak var l_cable: UILabel!
    @IBOutlet weak var l_school: UILabel!
    @IBOutlet weak var l_d1: UILabel!
    @IBOutlet weak var l_d2: UILabel!
    @IBOutlet weak var l_d3: UILabel!
    @IBOutlet weak var l_d4: UILabel!
    @IBOutlet weak var l_d5: UILabel!
    @IBOutlet weak var pb_progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.i_rent.alpha = 0
        self.i_electric.alpha = 0
        self.i_water.alpha = 0
        self.i_cable.alpha = 0
        self.i_school.alpha = 0
        self.l_rent.alpha = 0
        self.l_electric.alpha = 0
        self.l_water.alpha = 0
        self.l_cable.alpha = 0
        self.l_school.alpha = 0
        self.l_d1.alpha = 0
        self.l_d2.alpha = 0
        self.l_d3.alpha = 0
        self.l_d4.alpha = 0
        self.l_d5.alpha = 0
        
        self.b_next.layer.cornerRadius = 50
        self.b_next.layer.shadowColor = UIColor.black.cgColor
        self.b_next.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.b_next.layer.shadowRadius = 3
        self.b_next.layer.shadowOpacity = 0.5
        
        self.pb_progressBar.transform = self.pb_progressBar.transform.scaledBy(x: 1, y: 10)
        
        var frameRect:CGRect = i_rent.frame
        frameRect.size.height = 40
        i_rent.frame = frameRect
        
        self.i_rent.returnKeyType = UIReturnKeyType.done
        self.i_rent.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_rent.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_rent.delegate = self
        self.i_rent.borderStyle = UITextBorderStyle.none
        self.i_rent.layer.addSublayer(self.getBorder(self.i_rent))
        
        frameRect = i_electric.frame
        frameRect.size.height = 40
        i_electric.frame = frameRect
        
        self.i_electric.returnKeyType = UIReturnKeyType.done
        self.i_electric.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_electric.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_electric.delegate = self
        self.i_electric.borderStyle = UITextBorderStyle.none
        self.i_electric.layer.addSublayer(self.getBorder(self.i_electric))
        
        frameRect = i_water.frame
        frameRect.size.height = 40
        i_water.frame = frameRect
        
        self.i_water.returnKeyType = UIReturnKeyType.done
        self.i_water.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_water.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_water.delegate = self
        self.i_water.borderStyle = UITextBorderStyle.none
        self.i_water.layer.addSublayer(self.getBorder(self.i_water))
        
        frameRect = i_cable.frame
        frameRect.size.height = 40
        i_cable.frame = frameRect
        
        self.i_cable.returnKeyType = UIReturnKeyType.done
        self.i_cable.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_cable.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_cable.delegate = self
        self.i_cable.borderStyle = UITextBorderStyle.none
        self.i_cable.layer.addSublayer(self.getBorder(self.i_cable))
        
        frameRect = i_school.frame
        frameRect.size.height = 40
        i_school.frame = frameRect
        
        self.i_school.returnKeyType = UIReturnKeyType.done
        self.i_school.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_school.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_school.delegate = self
        self.i_school.borderStyle = UITextBorderStyle.none
        self.i_school.layer.addSublayer(self.getBorder(self.i_school))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fadeInInput()
    }
    
    func fadeInInput() -> Void {
        print("Input has faded in")
        UIView.animate(withDuration: 0,
                       delay: 0.5,
                       options: .curveEaseIn,
                       animations: {
        },
                       completion: { finished in
                        self.pb_progressBar.animate(start: myData.currProgBar, duration: 1, delay: 0, progress: 0.67)
                        myData.currProgBar = 0.67
        })
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       options: .curveEaseIn,
                       animations: {
                        self.i_rent.alpha = 1
                        self.i_electric.alpha = 1
                        self.i_water.alpha = 1
                        self.i_cable.alpha = 1
                        self.i_school.alpha = 1
                        self.l_rent.alpha = 1
                        self.l_electric.alpha = 1
                        self.l_water.alpha = 1
                        self.l_cable.alpha = 1
                        self.l_school.alpha = 1
                        self.l_d1.alpha = 1
                        self.l_d2.alpha = 1
                        self.l_d3.alpha = 1
                        self.l_d4.alpha = 1
                        self.l_d5.alpha = 1
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
    
    @IBAction func backTapped(_ sender: Any) {
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "MyBudget")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        myData.rent = Float(self.i_rent.text!)!
        myData.electric = Float(self.i_electric.text!)!
        myData.water = Float(self.i_water.text!)!
        myData.cable = Float(self.i_cable.text!)!
        myData.school = Float(self.i_school.text!)!
        
        myData.getPercExpenses()
        
        myData.fillPercLiving()
        myData.fillPercSavings()
        myData.fillPercFood()
        
        print(myData)
        
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "HowICompare")
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
