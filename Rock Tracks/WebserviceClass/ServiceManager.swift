//
//  ServiceManager.swift
//  JsonExample
//
//  Created by shikha  on 09/03/18.
//  Copyright © 2018 shikha . All rights reserved.
//

import Foundation


public typealias completion = (_ response:AnyObject?, _ error:Error? ) -> Void


class ServiceManager {
    
   static func getData(_ url: String, completion:@escaping completion){
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                return
            }
            // make sure we got data
            guard let responseData = data else {
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                
                
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
                    
                    print("error trying to convert data to JSON")
                    let jsonData = try! JSONSerialization.jsonObject(with: responseData, options: .allowFragments)
                    print(jsonData)
                    completion(jsonData as AnyObject?,error)
                    
                    return
                }
                print("The Response is: " + todo.description)
                completion(todo as AnyObject?,error)
                
                
                
            } catch  {
                
                print("error trying to convert data to JSON")
                
                return
            }
            
            
        }
        task.resume()
        
        
    }
}
