//
//  SecondViewController.swift
//  Independent Work
//
//  Created by Danielle Pintz on 4/3/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
let searchController = UISearchController(searchResultsController: nil)
 var filteredSongs = [String]()
    @IBOutlet var table: UITableView!
    var alertController:UIAlertController?
    var Songs = ["Acquainted - The Weeknd", "Alive - Krewella", "All of the Lights - Kanye West", "All of Me - John Legend", "Alright - Kendrick Lamar", "Amazing - Kanye West", "Animals - Martin Garrix", "Antidote - Travi$ Scott", "Apparently - J. Cole", "Applause - Lady Gaga", "Big Poppa - Notorious B.I.G.", "Big Rings - Future & Drake", "Dark Horse - Katy Perry", "Dark Times - The Weeknd", "Earned It - The Weeknd", "Energy - Drake", "Ice Cream Man - Tyga", "Intoxicated - Martin Solveig", "Jesus Walks - Kanye West", "Jumpman - Future & Drake", "Just A Lil Bit - 50 Cent", "Land of the Snakes - J. Cole", "Last Resort - Papa Roach", "Last Friday Night (T.G.I.F.) - Katy Perry", "Last Sun - Fjordne", "Latch - Disclosure feat. Sam Smith", "Late - Kanye West", "Late Nights - Snoop Dogg", "Latin Blues - Dave Pike", "Lean On - Major Lazer", "Light Up - Drake feat. JAY Z", "Lights Please - J. Cole", "Like Toy Soldiers - Eminem", "Loft Music - The Weeknd", "Low - Flo Rida feat. T-Pain", "Low Life - Future feat. The Weeknd", "Power Trip - J. Cole feat. Miguel", "Practice - Drake", "Wake Me Up - Avicii", "Waves - Kanye West", "Yeah! - Usher" ,"You See Me - Childish Gambino"]
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredSongs.count
        }
        return Songs.count
    }
    
    
        @IBAction func cancel(segue:UIStoryboardSegue) {
            table.reloadData()
        }

    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredSongs = Songs.filter { song in
            return song.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        table.reloadData()
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HCell", forIndexPath: indexPath)
        
        let song: String
        if searchController.active && searchController.searchBar.text != "" {
            song = filteredSongs[indexPath.row]
        } else {
            song = Songs[indexPath.row]
        }
        cell.textLabel?.text = song
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let song: String
        if searchController.active && searchController.searchBar.text != "" {
            song = filteredSongs[indexPath.row]
        } else {
            song = Songs[indexPath.row]
        }
       Requests.append(song)
        NetVotes[song] = 1
        
        let alert = UIAlertView()
        alert.title = "Your request has been sent to the queue!"
        alert.addButtonWithTitle("Dismiss")
        alert.show()
//        
//        alertController = UIAlertController(title: "Your request has been sent to the queue!", preferredStyle:.Alert)
//        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
//        
//        self.presentViewController(alertController, animated: true, completion: nil)
//        
        // Delay the dismissal by 5 seconds
//        let delay = 1.0 * Double(NSEC_PER_SEC)
//        var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
//        dispatch_after(time, dispatch_get_main_queue(), {
//            alert.dismissWithClickedButtonIndex(-1, animated: true)
//        })

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
        
        override func viewDidAppear(animated: Bool) {
            table.reloadData()
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            table.delegate = self
            table.dataSource = self
            searchController.searchResultsUpdater = self
            searchController.dimsBackgroundDuringPresentation = false
            definesPresentationContext = true
            table.tableHeaderView = searchController.searchBar
    }
        
        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
        {
            if editingStyle == UITableViewCellEditingStyle.Delete
            {
                Songs.removeAtIndex(indexPath.row)
                table.reloadData()
                
            }
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
}

extension SecondViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}


