//
//  RecentRequestsViewCell.swift
//  UpNext
//
//  Created by Danielle Pintz on 4/30/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//

import UIKit

class RecentRequestsViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var row = 0

    @IBOutlet var number: UILabel!
    @IBOutlet var songname: UILabel!
    @IBOutlet var heart: UIButton!
    var liked = false
   
    @IBAction func like(sender: AnyObject) {
        if (liked) {
    let song = Requests[row]
    NetVotes.updateValue(NetVotes[song]!-1, forKey: song)
    NSUserDefaults.standardUserDefaults().setObject(NetVotes, forKey: "vote")
    self.number.text = String(NetVotes[song]!)
    self.heart.setTitleColor(UIColor.redColor(), forState: .Normal)
    heart.setTitle("♡", forState: .Normal)
        liked = false
            let indexOfsong = Liked.indexOf(song)
            Liked.removeAtIndex(indexOfsong!)
            let delay = 0.7 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                NSNotificationCenter.defaultCenter().postNotificationName("refreshMyTableView", object: nil)
            }
    NSUserDefaults.standardUserDefaults().setObject(Liked, forKey: "likes")
        }
        
        else {
            let song = Requests[row]
            NetVotes.updateValue(NetVotes[song]!+1, forKey: song)
            NSUserDefaults.standardUserDefaults().setObject(NetVotes, forKey: "vote")
            self.number.text = String(NetVotes[song]!)
            heart.setTitle("♥", forState: .Normal)
            liked = true
            Liked.append(song)
            let delay = 0.7 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                NSNotificationCenter.defaultCenter().postNotificationName("refreshMyTableView", object: nil)
            }
             NSUserDefaults.standardUserDefaults().setObject(Liked, forKey: "likes")
        }

    }
}
