//
//  ViewController.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/25/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginVC: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var i_email: UITextField!
    @IBOutlet weak var i_password: UITextField!
    @IBOutlet weak var b_login: UIButton!
    @IBOutlet weak var b_register: UIButton!
    @IBOutlet weak var l_output: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.i_email.returnKeyType = UIReturnKeyType.done
        self.i_email.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_email.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_email.delegate = self
        
        self.i_password.returnKeyType = UIReturnKeyType.done
        self.i_password.clearButtonMode = UITextFieldViewMode.whileEditing;
        self.i_password.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.i_password.delegate = self
        
        var frameRect:CGRect = i_email.frame
        frameRect.size.height = 40
        i_email.frame = frameRect
        frameRect = i_password.frame
        frameRect.size.height = 40
        i_password.frame = frameRect
        
        b_login.layer.cornerRadius = 10
        
    }
    
    @IBAction func tapView(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func login(_ sender: Any) {
        //makes rest call
        Alamofire.request(url + "/users/" + self.i_email.text!, method: .get, encoding: JSONEncoding.default).responseJSON {
            response in
            //print(response)
            switch response.result {
            case .success(_):
                print("Success")
                let myJson = JSON(response.result.value!)
                print(myJson)
                if myJson.count != 0 {
                    if myJson[0]["password"].string! == self.i_password.text {
                        print("Successful login")
                        //if correct redirect
                        
                        self.requestBudgetData()
                        
                        } else {
                            self.l_output.text = "The email or password entered is incorrect."
                            self.l_output.isHidden = false
                    }
                } else {
                    self.l_output.text = "The email or password entered is incorrect."
                    self.l_output.isHidden = false
                }
            case .failure(_):
                self.l_output.text = "Request failed please try again."
                self.l_output.isHidden = false
            }
            debugPrint(response) }
        
    }
    
    func requestBudgetData() {
        Alamofire.request(url + "/budget_data/" + self.i_email.text!, method: .get, encoding: JSONEncoding.default).responseJSON {
            response in
            //print(response)
            switch response.result {
            case .success(_):
                print("Success")
                let myJson = JSON(response.result.value!)
                print(myJson)
                if myJson.count != 0 {
                    
                    myData.totalBudget = myJson[0]["income_monthly"].float!
                    myData.percFood = myJson[0]["food_perc"].int!
                    myData.percLiving = myJson[0]["living_perc"].int!
                    myData.percSavings = myJson[0]["savings_perc"].int!
                    
                    self.requestLivingBudgetData()

                } else {
                    //Direct to putting in info
                    let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "MyBudget")
                    self.present(nextViewController, animated:true, completion:nil)
                }
            case .failure(_):
                self.l_output.text = "Request failed please try again."
                self.l_output.isHidden = false
            }
            debugPrint(response) }
    }
    
    func requestLivingBudgetData() {
        Alamofire.request(url + "/living_budget_data/" + self.i_email.text!, method: .get, encoding: JSONEncoding.default).responseJSON {
            response in
            //print(response)
            switch response.result {
            case .success(_):
                print("Success")
                let myJson = JSON(response.result.value!)
                print(myJson)
                if myJson.count != 0 {
                    
                    myData.percRent = myJson[0]["rent_perc"].int!
                    myData.percElectric = myJson[0]["electric_perc"].int!
                    myData.percWater = myJson[0]["water_perc"].int!
                    myData.percCable = myJson[0]["cable_internet_perc"].int!
                    myData.percSchool = myJson[0]["school_perc"].int!
                    
                    myData.userId = self.i_email.text!
                    
                    let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "HomeVC")
                    self.present(nextViewController, animated:true, completion:nil)
                } else {
                    //Direct to putting in info
                    let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "MyBudget")
                    self.present(nextViewController, animated:true, completion:nil)
                }
            case .failure(_):
                self.l_output.text = "Request failed please try again."
                self.l_output.isHidden = false
            }
            debugPrint(response) }
    }
    
    @IBOutlet weak var register: UIButton!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

