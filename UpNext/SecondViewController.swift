//
//  SecondViewController.swift
//  Independent Work
//
//  Created by Danielle Pintz on 4/3/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var newword = ""

    @IBOutlet var word: UITextField!
    @IBAction func addWord(sender: AnyObject) {
        if !(word.text == "") {
            if !(Requests.contains(word.text!)) {
        Requests.append(word.text!)
        NetVotes[word.text!] = 1
        word.text = ""
        NSUserDefaults.standardUserDefaults().setObject(NetVotes, forKey: "vote")
        NSUserDefaults.standardUserDefaults().setObject(Requests, forKey: "arr")
            }
        }
    }
    
       override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

