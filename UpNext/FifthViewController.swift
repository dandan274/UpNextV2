//
//  FifthViewController.swift
//  Independent Work
//
//  Created by Danielle Pintz on 4/18/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//

import UIKit
var Playlists = ["Zak's Study Session", "Zak's Cookout", "Zak's Friday Morning Meditation"]

class FifthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var alertController:UIAlertController?

    @IBOutlet var table: UITableView!
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Playlists.count
    }
    @IBAction func cancel(segue:UIStoryboardSegue) {
        table.reloadData()
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "PCell")
        cell.textLabel?.text = Playlists[indexPath.row]
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let playlistname = Playlists[indexPath.row]
        let alert = UIAlertView()
        alert.title = "You are now hosting " + playlistname + "!"
        alert.addButtonWithTitle("Dismiss")
        alert.show()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            Playlists.removeAtIndex(indexPath.row)
            table.reloadData()
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


