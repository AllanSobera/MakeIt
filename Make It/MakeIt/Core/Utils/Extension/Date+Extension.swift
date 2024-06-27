//
//  Date+Extension.swift
//  MakeIt
//
//  Created by Allan Soberanski on 26/06/24.
//

import Foundation

extension Date {
    /// Date formated to String showing just the hours  with this format  HH:mm:ss
    var formattedHour: String {
        get {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "HH:mm:ss"
            return dateFormat.string(from: self)
        }
    }
    
    /// Date formated to String showing just the date with this format  dd/MM/yyyy
    var formattedDate: String {
        get {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "dd/MM/yyyy"
            return dateFormat.string(from: self)
        }
    }
}
