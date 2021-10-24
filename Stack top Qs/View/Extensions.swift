//
//  Extensions.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 24.10.2021.
//

import Foundation

extension Int {
    var thousandsFormatting: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let number = self > 100 ? NSNumber(value: Float(self) / 1000) : NSNumber(value: self)
        return formatter.string(from: number) ?? "NaN"
    }
}

extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
