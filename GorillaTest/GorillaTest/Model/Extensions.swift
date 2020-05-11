//
//  Extensions.swift
//  GorillaTest
//
//  Created by Eduardo Oliveros Acosta on 11/05/20.
//  Copyright © 2020 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation


extension String {
    func getDateFromTimeStamp() -> String {
        
        guard let timeStamp = Double(self) else {
            return ""
        }
        let date = NSDate(timeIntervalSince1970: timeStamp)

        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"

        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    func getPrettyDateFromTimeStamp() -> String {
        
        guard let timeStamp = Double(self) else {
            return ""
        }
        let date = Date(timeIntervalSince1970: timeStamp)

        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM yyyy"

        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
}

extension Date {
    func getPrettyDate() -> String {
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM yyyy"

        let dateString = dayTimePeriodFormatter.string(from: self)
        return dateString
    }
}
