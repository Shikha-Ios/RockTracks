//
//  Track.swift
//  Rock Tracks
//
//  Created by shikha  on 09/03/18.
//  Copyright © 2018 shikha . All rights reserved
//

import Foundation

class Track {
    var trackName: String!
    var artworkUrl100: String!
    var trackPrice: NSNumber!
    var artistName: String!
    var releaseDate: String!
    var trackViewUrl: String!

    init(_ parameters: Dictionary<String, Any>) {
        
        trackName = parameters["trackName"] as! String
        trackPrice = parameters["trackPrice"] as! NSNumber
        artistName = parameters["artistName"] as! String
        artworkUrl100 =  parameters["artworkUrl100"] as! String
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: ((parameters["releaseDate"] as! String).components(separatedBy: "T"))[0])
        dateFormatter.dateFormat = "yyyy-MM-dd"
        releaseDate           = dateFormatter.string(from: date!)
        trackViewUrl =  parameters["trackViewUrl"] as! String

    }
}



