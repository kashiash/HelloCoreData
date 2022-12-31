//
//  UIImageTransformer.swift
//  HelloCoreData
//
//  Created by Jacek Kosiński G on 31/12/2022.
//

import SwiftUI



class UIImageTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? { guard let image = value as? UIImage
        else { return nil }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject:image, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
        
    }
    override func reverseTransformedValue(_ value: Any?) -> Any? { guard let data = value as? Data
        else {
        return nil }
        do {
            let image = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
            return image
        } catch {
            return nil
        }
        
    }
}
