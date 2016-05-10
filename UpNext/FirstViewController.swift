//
//  FirstViewController.swift
//  Independent Work
//
//  Created by Danielle Pintz on 4/3/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//
import UIKit

var Requests = ["Latch - Disclosure feat. Sam Smith", "Practice - Drake", "Careless Whisper - George Michael", "My Boo - Ghost Town DJs", "Where is my Mind? - Pixies", "Somewhere on a Beach - Dierks Bentley"]
var NetVotes = ["Latch - Disclosure feat. Sam Smith" : 21, "Practice - Drake": 16, "Careless Whisper - George Michael": 15, "My Boo - Ghost Town DJs":15, "Where is my Mind? - Pixies": 10, "Somewhere on a Beach - Dierks Bentley": 7, "Colder Weather - Zac Brown Band": 7]

var change = false
var Liked = [String]()

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    
    @IBAction func play(sender: AnyObject) {
        var song = Requests[0]
        Requests.removeAtIndex(0)
        NetVotes.removeValueForKey(song)
        table.reloadData()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
     return Requests.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RecentRequestsViewCell
        let song = Requests[indexPath.row]
        if (Liked.contains(song)) {
            cell.liked = true
            cell.heart.setTitle("♥", forState: .Normal)
        }
        else {
        cell.heart.setTitle("♡", forState: .Normal)
        cell.liked = false
        cell.heart.setTitleColor(UIColor.redColor(), forState: .Normal)
        }
        cell.songname.text = song
        cell.row = indexPath.row
        print(Requests)
        cell.number.text = String(NetVotes[song]!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
        //NSNotificationCenter.defaultCenter().postNotificationName("refreshMyTableView", object: nil)
    }
    
    func refreshList(notification: NSNotification){
        let byValue = {
            (elem1:(key: String, val: Int), elem2:(key: String, val: Int))->Bool in
            if elem1.val > elem2.val {
                return true
            } else {
                return false
            }
        }
        let sortedDict = NetVotes.sort(byValue)
        Requests = []
        for index in 0...sortedDict.count-1 {
            let songname = sortedDict[index].0
            Requests.append(songname)
        }
        NSUserDefaults.standardUserDefaults().setObject(Requests, forKey: "arr")
        table.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyTableView", object: nil)
        // Do any additional setup after loading the view, typically from a nib.
//        if NSUserDefaults.standardUserDefaults().objectForKey("arr") != nil
//        {
//            Requests = NSUserDefaults.standardUserDefaults().objectForKey("arr") as! [String]
//        }
//        if NSUserDefaults.standardUserDefaults().objectForKey("vote") != nil
//        {
//            NetVotes = NSUserDefaults.standardUserDefaults().objectForKey("vote") as! [String: Int]
//        }
//        if NSUserDefaults.standardUserDefaults().objectForKey("likes") != nil
//        {
//            Liked = NSUserDefaults.standardUserDefaults().objectForKey("likes") as! [String]
//        }
//       
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            let song = Requests[indexPath.row]
            Requests.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(Requests, forKey: "arr")
            table.reloadData()
            if (Liked.contains(song)) {
            let indexOfsong = Liked.indexOf(song)
            Liked.removeAtIndex(indexOfsong!)
            NSUserDefaults.standardUserDefaults().setObject(Liked, forKey: "likes")
            }
            NetVotes.removeValueForKey(song)
            NSUserDefaults.standardUserDefaults().setObject(NetVotes, forKey: "vote")

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

