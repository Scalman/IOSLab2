//
//  SecondVC.swift
//  AppIntroduction
//
//  Created by Waleed Hassan on 16/11/16.
//  Copyright © 2016 SchoolWork. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var textFiald: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load: second")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear: second")
        textFiald.text = "Varje drag innebär att man flyttar en pjäs längs spelets linjer till en tom intilliggande plats. Om man inte kan göra det så har man förlorat. Även nu undviker man om möjligt att ta isär kvarnar. En spelare som bara har två pjäser kvar kan inte bygga fler kvarnar vilket innebär att hon inte kan slå ut några fler motståndarpjäser, och hon har därför förlorat."
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear: second")
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
