//
//  FourthViewController.swift
//  Independent Work
//
//  Created by Danielle Pintz on 4/7/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//
import UIKit

class FourthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Requests.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RecentRequestsViewCell
        let song = Requests[indexPath.row]
        cell.heart.setTitle("♡", forState: .Normal)
        cell.heart.setTitleColor(UIColor.redColor(), forState: .Normal)
        cell.songname.text = song
        cell.row = indexPath.row
        cell.number.text = String(NetVotes[song]!)
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NSUserDefaults.standardUserDefaults().objectForKey("arr") != nil
        {
            Requests = NSUserDefaults.standardUserDefaults().objectForKey("arr") as! [String]
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("vote") != nil
        {
            NetVotes = NSUserDefaults.standardUserDefaults().objectForKey("vote") as! [String: Int]
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            Requests.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(Requests, forKey: "arr")
            table.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

