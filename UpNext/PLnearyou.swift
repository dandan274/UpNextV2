//
//  PLnearyou.swift
//  UpNext
//
//  Created by Danielle Pintz on 5/1/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//

import UIKit

var Playlists2 = ["Starbucks", "Pablo's Cinco De Mayo Rager", "Small World Coffee", "Gil's Book Club", "Terrace Upstairs", "Zak's Pregame"]

class PLnearyou: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var alertController:UIAlertController?

    @IBOutlet var table: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Playlists2.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "DCell")
        cell.textLabel?.text = Playlists2[indexPath.row]
        return cell
    }
    
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       table.delegate = self
       table.dataSource = self    
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            Playlists2.removeAtIndex(indexPath.row)
            table.reloadData()
            
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       let playlistname = Playlists2[indexPath.row]
        let alert = UIAlertView()
        alert.title = "You are now tuned in to " + playlistname + "!"
        alert.addButtonWithTitle("Dismiss")
        alert.show()
         tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
   

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


