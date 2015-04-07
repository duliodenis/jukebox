//
//  PlaylistDetailViewController.swift
//  jukebox
//
//  Created by Dulio Denis on 3/20/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController {

    var playlist: Playlist?
    
    @IBOutlet weak var playlistCoverImage: UIImageView!
    @IBOutlet weak var playlistTitle: UILabel!
    @IBOutlet weak var playlistDescription: UILabel!
    
    @IBOutlet weak var playlistVideoButton0: UIButton!
    @IBOutlet weak var playlistVideoButton1: UIButton!
    @IBOutlet weak var playlistVideoButton2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if playlist != nil {
            playlistCoverImage.image = playlist!.largeIcon
            playlistCoverImage.backgroundColor = playlist!.backgroundColor
            playlistTitle.text = playlist!.title
            playlistDescription.text = playlist!.description
            
            playlistVideoButton0.setTitle(playlist!.videos[0], forState: .Normal)
            playlistVideoButton1.setTitle(playlist!.videos[1], forState: .Normal)
            playlistVideoButton2.setTitle(playlist!.videos[2], forState: .Normal)
            
        }
    }
    
    @IBAction func videoSelected(sender: UIButton!) {
        println(sender.tag)
        var remote = VideoExtractor()
        remote.fetchVideoURLFromURL(playlist!.urls[sender.tag])
        remote.connect(playlist!.urls[sender.tag])
    }

}
