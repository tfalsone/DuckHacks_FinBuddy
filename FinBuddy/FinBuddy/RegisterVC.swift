//
//  RegisterVC.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/25/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import Alamofire

class RegisterVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var i_fullName: UITextField!
    @IBOutlet weak var i_email: UITextField!
    @IBOutlet weak var i_password: UITextField!
    @IBOutlet weak var i_conPassword: UITextField!
    @IBOutlet weak var b_submit: UIButton!
    @IBOutlet weak var l_notify: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.b_submit.layer.cornerRadius = 10
        self.l_notify.isHidden = true
        
        self.i_fullName.returnKeyType = UIReturnKeyType.done
        self.i_fullName.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_fullName.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_fullName.delegate = self
        self.i_fullName.borderStyle = UITextBorderStyle.none
        self.i_fullName.layer.addSublayer(self.getBorder(self.i_fullName))
        
        self.i_email.returnKeyType = UIReturnKeyType.done
        self.i_email.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_email.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_email.delegate = self
        self.i_email.borderStyle = UITextBorderStyle.none
        self.i_email.layer.addSublayer(self.getBorder(self.i_email))
        
        self.i_password.returnKeyType = UIReturnKeyType.done
        self.i_password.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_password.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_password.delegate = self
        self.i_password.borderStyle = UITextBorderStyle.none
        self.i_password.layer.addSublayer(self.getBorder(self.i_password))
        
        self.i_conPassword.returnKeyType = UIReturnKeyType.done
        self.i_conPassword.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_conPassword.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_conPassword.delegate = self
        self.i_conPassword.borderStyle = UITextBorderStyle.none
        self.i_conPassword.layer.addSublayer(self.getBorder(self.i_conPassword))
    }
    @IBAction func tapView(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.i_fullName.text != "" && self.i_email.text != ""  && self.i_password.text != "" && self.i_conPassword.text != ""{
            if  self.i_password.text == self.i_conPassword.text {
                self.l_notify.isHidden = true
                self.b_submit.isEnabled = true
                self.b_submit.alpha = 1.0
            }
            else
            {
                self.l_notify.isHidden = false
                self.b_submit.isEnabled = false
                self.b_submit.alpha = 0.7
            }
        }
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
    @IBAction func submitRegister(_ sender: Any) {
        //make rest call POST
        let postInfo = [
            "user_id": self.i_email.text!,
            "password": self.i_password.text!,
            "name": self.i_fullName.text!
            ] as [String : Any]
        Alamofire.request("http://155.246.213.64:3000/users", method: .post, parameters: postInfo, encoding: JSONEncoding.default).responseJSON {
            response in
            
            debugPrint(response) }
        
        myData.userId = self.i_email.text!
        myData.name = self.i_fullName.text!
        
        //navigate to putting in info
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "MyBudget")
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
