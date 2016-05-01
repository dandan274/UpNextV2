//
//  NewsFeedTableViewCell.swift
//  UpNext
//
//  Created by Danielle Pintz on 4/30/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//


import UIKit

class NewsFeedTableViewCell: UITableViewCell {
    var row = 0
 
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    
    var counter: Int = 0
    var hasTapped: Bool = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.likesLabel.text = "\u{e022}"
        /*if (mealLiked[row]) {
         hasTapped = true
         self.likeButton.setTitle("Unlike", forState: .Normal)
         self.likeButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
         }*/
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func tapLikeButton(sender: UIButton) {
        if hasTapped {
            counter--
            hasTapped = false
            // mealLiked[row] = false
            self.likeButton.setTitle("Like", forState: .Normal)
            self.likeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            let newsRoot = dataBaseRoot.childByAppendingPath("newsfeed/" + String(row) + "/Likes")
            let otherRoot = dataBaseRoot.childByAppendingPath("newsfeed/" + String(row))
            var likes = 0
            newsRoot.observeSingleEventOfType(.Value, withBlock: { snapshot in
                let currlikes = String(snapshot.value)
                likes = Int(currlikes)!-1
                let dict = ["Likes" : String(likes)]
                otherRoot.updateChildValues(dict)
                }, withCancelBlock: { error in
            })
            
        }
        else {
            counter++
            hasTapped = true
            // mealLiked[row] = true
            self.likeButton.setTitle("Unlike", forState: .Normal)
            self.likeButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
            let newsRoot = dataBaseRoot.childByAppendingPath("newsfeed/" + String(row) + "/Likes")
            let otherRoot = dataBaseRoot.childByAppendingPath("newsfeed/" + String(row))
            var likes = 0
            newsRoot.observeSingleEventOfType(.Value, withBlock: { snapshot in
                let currlikes = String(snapshot.value)
                likes = Int(currlikes)!+1
                let dict = ["Likes" : String(likes)]
                otherRoot.updateChildValues(dict)
                }, withCancelBlock: { error in
            })
            
        }
    }
    
}

