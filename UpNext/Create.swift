//
//  Create.swift
//  UpNext
//
//  Created by Danielle Pintz on 5/1/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//

import UIKit

class Create: UIViewController {
    
    @IBOutlet var name: UITextField!
   
    @IBAction func create(sender: AnyObject) {
        Playlists.append(name.text!)
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

