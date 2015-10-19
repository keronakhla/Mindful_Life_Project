//
//  SitPlayerViewController.swift
//  MindfulLifeProject
//
//  Created by Christopher Queen on 10/16/15.
//  Copyright © 2015 Christopher Queen. All rights reserved.
//

import UIKit
import AVFoundation

class SitPlayerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var playerItem:AVPlayerItem!
    var player:AVPlayer!
    
    var playlistTitleAndId:(title:String, id:String) = ("", "")
    var trackTitles:[String] = ["Loading..."]
    var trackUrls:[String] = []
    //    let clientUrl = "bc8400d9ccfc6ef41c9aca544ea5deb0"
    
    @IBOutlet weak var trackListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let defaults = NSUserDefaults.standardUserDefaults()
        let language = defaults.valueForKey("language")
        
        // playlistLabel.text = playlistTitleAndId.title
        trackListTableView.dataSource = self
        trackListTableView.delegate = self
        let sitsModel = Sits()
        sitsModel.getTracksAndIdsFromPlaylist(playlistTitleAndId.id, onComplete: { trackTitlesAndUrls in
            self.trackTitles = Array(trackTitlesAndUrls.keys)
            self.trackListTableView.dataSource = self
            self.trackListTableView.reloadData()
            self.trackUrls = Array(trackTitlesAndUrls.values)
            
            // TODO  Make sure it's not empty
            let firstStreamUrl = self.trackUrls[0]
            let url = NSURL(string: firstStreamUrl)
            self.playerItem = AVPlayerItem(URL: url!)
            self.player = AVPlayer(playerItem: self.playerItem)
            
            let playerLayer = AVPlayerLayer(player: self.player)
            playerLayer.frame =  CGRectMake(0, 0, 300, 50)
            self.view.layer.addSublayer(playerLayer)
            
            
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    //
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.trackTitles.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("track", forIndexPath: indexPath)
        var titlesArray = trackTitles
        let sit = titlesArray[indexPath.row]
        cell.textLabel?.text = sit
        // Configure the cell...
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        authorLabel.text? = trackTitles[indexPath.row]
        let trackUrl = NSURL(string: trackUrls[indexPath.row])
        //        let newPlayerItem = AVPlayerItem(URL: trackUrl)
        player.replaceCurrentItemWithPlayerItem(AVPlayerItem(URL: trackUrl!))
        if(self.player.rate == 0) {
            self.player.play()
//            playButton.setTitle("PAUSE", forState: .Normal)
        }
        
    }
    
    @IBAction func toggleButton(sender: AnyObject) {
        if player.rate == 0 {
            self.player.play()
//            playButton.setTitle("PAUSE", forState: .Normal)
        } else {
            self.player.pause()
//            playButton.setTitle("PLAY", forState: .Normal)
        }
    }

}

