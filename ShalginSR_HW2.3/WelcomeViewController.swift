//
//  WelcomeViewController.swift
//  ShalginSR_HW2.3
//
//  Created by Станислав on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var helloLabel: UILabel!
    @IBOutlet var emodjiLablel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emodjiLablel.text = "\u{1F44B}"
        helloLabel.text = "Welcome, " + userName + "!"
    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true)
    }
}
