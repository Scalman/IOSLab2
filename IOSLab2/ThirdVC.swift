//
//  ThirdVC.swift
//  AppIntroduction
//
//  Created by Waleed Hassan on 16/11/16.
//  Copyright © 2016 SchoolWork. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    
    @IBOutlet weak var getReadyBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //getReadyBtn.layer.cornerRadius = 15
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
