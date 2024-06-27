//
//  Date+Extension.swift
//  MakeIt
//
//  Created by Allan Soberanski on 26/06/24.
//

import Foundation

extension Date {
    /// Date formatted to String showing just the hours  with this format  HH:mm
    var formattedHourMinute: String {
        get {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "HH:mm"
            return dateFormat.string(from: self)
        }
    }
    
    /// Date formatted to String showing just the date with this format  dd/MM/yyyy
    var formattedDate: String {
        get {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "dd/MM/yyyy"
            return dateFormat.string(from: self)
        }
    }
}
