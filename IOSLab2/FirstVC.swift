//
//  SecondVC.swift
//  AppIntroduction
//
//  Created by Waleed Hassan on 16/11/16.
//  Copyright © 2016 SchoolWork. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var textFiald: UILabel!
    
    @IBOutlet weak var textTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*UIView.animateKeyframes(withDuration: 10.0, delay: 2.0, options: [], animations: {
            
            self.textFiald.alpha = 1
            
        }, completion: nil)*/
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // textFiald.alpha = 0.0
        textFiald.text = "Vardera spelaren har nio pjäser som flyttas mellan brädets 24 platser. Målet är att slå ut minst sju av motståndarens pjäser eller sätta henne i ett läge där hon inte kan göra något regelrätt drag."
        textTitle.text = "Nine Men Morris"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
