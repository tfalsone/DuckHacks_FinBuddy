//
//  HowICompareVC.swift
//  FinBuddy
//
//  Created by Gregory Johnson on 3/26/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class HowICompareVC: UIViewController {
    
    @IBOutlet weak var pb_progressBar: UIProgressView!
    @IBOutlet weak var b_next: UIButton!
    @IBOutlet weak var s_living: UISlider!
    @IBOutlet weak var s_food: UISlider!
    @IBOutlet weak var s_savings: UISlider!
    @IBOutlet weak var l_living: UILabel!
    @IBOutlet weak var l_food: UILabel!
    @IBOutlet weak var l_savings: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.b_next.layer.cornerRadius = 50
        self.b_next.layer.shadowColor = UIColor.black.cgColor
        self.b_next.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.b_next.layer.shadowRadius = 3
        self.b_next.layer.shadowOpacity = 0.5
        
        self.pb_progressBar.transform = self.pb_progressBar.transform.scaledBy(x: 1, y: 10)
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AssessmentPop") as! AssessmentVC
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
        self.s_living.value = Float(myData.percLiving)
        self.l_living.text = "\(myData.percLiving)%"
        self.s_food.value = Float(myData.percFood)
        self.l_food.text = "\(myData.percFood)%"
        self.s_savings.value = Float(myData.percSavings)
        self.l_savings.text = "\(myData.percSavings)%"

        // Do any additional setup after loading the view.
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
                        self.pb_progressBar.animate(start: 0.25, duration: 1, delay: 0, progress: 0.5)
        })
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       options: .curveEaseIn,
                       animations: {
        },
                       completion: { finished in
                        self.pb_progressBar.animate(start: myData.currProgBar, duration: 1, delay: 0, progress: 0.75)
                        myData.currProgBar = 0.75
                        print("Done")
        })
    }
    
    @IBAction func backTapped(_ sender: Any) {
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
