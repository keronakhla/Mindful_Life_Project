//
//  LanguageSelectViewController.swift
//  MindfulLifeProject
//
//  Created by Christopher Queen on 10/16/15.
//  Copyright © 2015 Christopher Queen. All rights reserved.
//

import UIKit

class LanguageSelectViewController: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        defaults.registerDefaults(["language":"english"])
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    @IBAction func didSelectEnglish(sender: AnyObject) {
        defaults.setValue("english", forKey: "language")
        defaults.synchronize()
    }
    @IBAction func didSelectSpanish(sender: AnyObject) {
        defaults.setValue("spanish", forKey: "language")
        defaults.synchronize()
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }

}
