//
//  VideoExtractor.swift
//  jukebox
//
//  Created by Dulio Denis on 4/3/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

import Foundation

class VideoExtractor: NSObject {
    
    var data = NSMutableData()
    
    func fetchVideoURLFromURL(url: String) -> Void {
        let nsURL = NSURL(string: url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(nsURL!, completionHandler: { (data, response, error) -> Void in
            println("Task complete!")
            
            if error != nil { // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            
        })
        
    }
    
    func connect(url: String) {
        let fetchURL = NSURL(string: url)
        var request = NSURLRequest(URL: fetchURL!)
        var conn = NSURLConnection(request: request, delegate: self, startImmediately: true)
    }
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        println("didReceiveResponse")
    }
    
    func connection(connection: NSURLConnection!, didReceiveData conData: NSData!) {
        self.data.appendData(conData)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
     //   var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
        
        println(self.data)
    }
    
    deinit {
        println("deiniting")
    }
    
}
