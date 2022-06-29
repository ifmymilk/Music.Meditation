//
//  Extensions.swift
//  Music Meditation
//
//  Created by Simon LE on 13/06/2022.
//

import Foundation


extension DateComponentsFormatter {
    
    
    static let abreviated: DateComponentsFormatter = {
        print("Initializing DateComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        return formatter
    }()


static let positional: DateComponentsFormatter = {
    print("Initializing DateComponentsFormatter.positional")
    let formatter = DateComponentsFormatter()
    
    
    formatter.allowedUnits = [.minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    
    return formatter
}()
    
    
}
