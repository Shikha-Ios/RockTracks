//
//  Constant.swift
//  Pacira
//
//  Created by shikha  on 09/03/18.
//  Copyright © 2018 shikha . All rights reserved.
//

import Foundation

struct Constant {
  
//https://itunes.apple.com/search?term=rock&media=music
    struct URL {
        static let baseURL = "https://itunes.apple.com/"
        static let appLogin = Constant.URL.baseURL + "search?term=rock&media=music"
    }
}




// Custom Logs

func printlog<T>(_ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        let value = object()
        let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
        let queue = Thread.isMainThread ? "UI" : "BG"
        
        print("<\(queue)> \(fileURL) \(function)[\(line)]: " + String(reflecting: value))
    #endif
}
