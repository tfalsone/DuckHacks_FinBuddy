//
//  ViewController.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/25/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var i_email: UITextField!
    @IBOutlet weak var i_password: UITextField!
    @IBOutlet weak var b_login: UIButton!
    @IBOutlet weak var b_register: UIButton!
    @IBOutlet weak var l_output: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var frameRect:CGRect = i_email.frame
        frameRect.size.height = 40
        i_email.frame = frameRect
        frameRect = i_password.frame
        frameRect.size.height = 40
        i_password.frame = frameRect
        
        b_login.layer.cornerRadius = 10
        
    }
    
    @IBAction func login(_ sender: Any) {
        //makes rest call
        
        //if correct redirect
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "HomeVC")
        self.present(nextViewController, animated:true, completion:nil)
        
        //if incorrect display that it's wrong
        //l_output.text = "The email or password entered is incorrect"
        
    }
    
    @IBOutlet weak var register: UIButton!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

