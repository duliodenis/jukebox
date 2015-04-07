//
//  Playlist.swift
//  jukebox
//
//  Created by Dulio Denis on 3/21/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

import Foundation
import UIKit

struct Playlist {
    
    var title : String?
    var description: String?
    var icon: UIImage?
    var largeIcon: UIImage?
    var videos: [String] = []
    var urls: [String] = []
    var backgroundColor: UIColor = UIColor.clearColor()
    
    init(index: Int) {
        let videoLibrary = VideoLibrary().library
        let playlistDictionary = videoLibrary[index]
        title = playlistDictionary["title"] as String!
        description = playlistDictionary["description"] as String!
        
        let iconName = playlistDictionary["icon"] as String!
        icon = UIImage(named: iconName)
        
        let largeIconName = playlistDictionary["largeIcon"] as String!
        largeIcon = UIImage(named: largeIconName)
        
        videos += playlistDictionary["videos"] as [String]
        urls += playlistDictionary["urls"] as [String]
        
        let colorDictionary = playlistDictionary["backgroundColor"] as [String: CGFloat]
        backgroundColor = rgbColorFromDictionary(colorDictionary)
    }
    
    func rgbColorFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {
        
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}