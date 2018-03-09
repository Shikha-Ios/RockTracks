//
//  JsonClass.swift
//  JsonExample
//
//  Created by shikha  on 09/03/18.
//  Copyright © 2018 shikha . All rights reserved.
//

import Foundation

protocol JSONRepresentable {
    
    var JSONRepresentation: AnyObject{get}
    
}

protocol JSONSerializable: JSONRepresentable {
    
}

extension JSONSerializable {
    
    var JSONRepresentation: AnyObject {
        var representation = [String: AnyObject]() // Dictionary
        
        for case let (label?, value) in Mirror(reflecting: self).children {
            switch value {
            case let value as JSONRepresentable:
                representation[label] = value.JSONRepresentation
            
            case let value as Array<Any>:
                if let val = value as? [JSONSerializable] {
                    representation[label] = val.map({ $0.JSONRepresentation as AnyObject }) as AnyObject
                } else {
                    representation[label] = value as AnyObject
                }
                
            case let value as NSObject:
                representation[label] = value
                
            default:
                // Ignore any unserializable properties
                break
            }
        }
        
        return representation as AnyObject
    }
}

extension JSONSerializable {
    
    func toJSON() -> String? {
        
        let representation = JSONRepresentation
        
        guard JSONSerialization.isValidJSONObject(representation) else {
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: representation, options: [])
            return String(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }
}







