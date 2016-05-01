//
//  CurrentQueueViewCell.swift
//  UpNext
//
//  Created by Danielle Pintz on 4/30/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//

import Foundation

import UIKit

class CurrentQueueViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.heart.setTitle("\u{e022}", forState: .Normal)
        
    }
    
    var row = 0
    
    @IBOutlet var heart: UIButton!
    @IBOutlet var songname: UILabel!
    @IBOutlet var number: UILabel!
    var liked = false

    @IBAction func like(sender: AnyObject) {
        if (liked) {
            let song = Requests[row]
            NetVotes.updateValue(NetVotes[song]!-1, forKey: song)
            self.number.text = String(NetVotes[song]!)
            self.heart.setTitleColor(UIColor.redColor(), forState: .Normal)
            heart.setTitle("♡", forState: .Normal)
            liked = false
        }
            
        else {
            let song = Requests[row]
            NetVotes.updateValue(NetVotes[song]!+1, forKey: song)
            self.number.text = String(NetVotes[song]!)
            self.heart.setTitleColor(UIColor.blueColor(), forState: .Normal)
            heart.setTitle("♥", forState: .Normal)
            liked = true
        }
    }

    
}
