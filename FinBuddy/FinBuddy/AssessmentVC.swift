//
//  AssessmentVC.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/26/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class AssessmentVC: UIViewController {
    @IBOutlet weak var v_box: UIView!
    @IBOutlet weak var l_text: UITextView!
    @IBOutlet weak var b_close: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        l_text.text = myData.assessment
        
        b_close.layer.cornerRadius = 5 
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.v_box.layer.cornerRadius = self.v_box.frame.width/8
        self.v_box.layer.shadowColor = UIColor.black.cgColor
        self.v_box.layer.shadowOpacity = 1
        self.v_box.layer.shadowOffset = CGSize.zero
        self.v_box.layer.shadowRadius = 10
        
        self.showAnimate()
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished: Bool) in
            if(finished)
            {
                self.view.removeFromSuperview()
            }
        })
        
    }
    
    @IBAction func closePopup(_ sender: Any) {
        self.removeAnimate()
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
