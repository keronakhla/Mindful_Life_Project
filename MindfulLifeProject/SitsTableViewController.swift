//
//  SitsTableViewController.swift
//  MindfulLifeProject
//
//  Created by Christopher Queen on 10/10/15.
//  Copyright © 2015 Christopher Queen. All rights reserved.
//

import UIKit

class SitsTableViewController: UITableViewController {

    var playlistTitlesAndIds:[String:String] = ["Loading...":""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sitsModel = Sits()
        sitsModel.getPlaylistTitlesAndIds({ (resultDict:[String:String]) -> Void in
            ////            Set the data source and reload the table view
            self.playlistTitlesAndIds = resultDict
            self.tableView.reloadData()
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Table view data source
    //
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlistTitlesAndIds.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mindfulSit", forIndexPath: indexPath)
        var titlesArray = Array(playlistTitlesAndIds.keys)
        let sit = titlesArray[indexPath.row]
        cell.textLabel?.text = sit
        // Configure the cell...
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("Selected")
        print(self.tableView.indexPathForSelectedRow?.row)
        
        let playlistTitle = Array(playlistTitlesAndIds.keys)[(self.tableView.indexPathForSelectedRow?.row)!]
        let playlistId = Array(playlistTitlesAndIds.values)[(self.tableView.indexPathForSelectedRow?.row)!]
        
        let destinationController = segue.destinationViewController as? SitPlayerViewController
        
        destinationController!.playlistTitleAndId = (playlistTitle, playlistId)
    }

}
