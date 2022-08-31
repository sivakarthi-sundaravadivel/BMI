//
//  BodyTypeViewController.swift
//  BMI Check
//
//  Created by s.sivakarthi on 08/08/2022.
//

import UIKit

class BodyTypeViewController: UIViewController {

    @IBOutlet var bodytypeText: UILabel!
    
    
    var mySrting = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodytypeText.text = mySrting 

    }
    

}
