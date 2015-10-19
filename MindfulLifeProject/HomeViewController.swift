//
//  ViewController.swift
//  MindfulLifeProject
//
//  Created by Christopher Queen on 10/4/15.
//  Copyright © 2015 Christopher Queen. All rights reserved.
//

import UIKit
import AVFoundation
 
class HomeViewController: UIViewController {
    
    @IBOutlet weak var sitsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        TODO If you click on "Sits" button and you selected spanish, just open SitPlayerViewController programatically
    }
    
    func loadNextView() {
        print("Clicked!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

}

