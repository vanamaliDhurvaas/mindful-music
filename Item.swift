//
//  Song.swift
//  MusicApp
//
//  Created by Vanamali Dhurvaas on 6/28/22.
//

import Foundation

class Item
{
    var name: String
    var albumName: String
    var artistName: String
    var imageName: String
    var trackName: String

    init(name: String, albumName: String, artistName: String, imageName: String, trackName: String)
    {
        self.name = name
        self.albumName = albumName
        self.artistName = artistName
        self.imageName = imageName
        self.trackName = trackName

    }

}
