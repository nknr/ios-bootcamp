//
//  Logger.swift
//  ios-bootcamp
//
//  Created by Neeraj Kumar on 12/01/25.
//

import Foundation

struct Logger {
    
    private init(){}
    
    private static func printLog(_ message: String, level: Level = .info) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = dateFormatter.string(from: Date())
        print("\(timestamp): \(level): \(message)")
        
    }
    
    static func i(_ message: String) {
        printLog(message, level: .info)
    }
    
    static func e(_ message: String) {
        printLog(message, level: .error)
    }
    
    static func w(_ message: String) {
        printLog(message, level: .warning)
    }
    
    static func d(_ message: String) {
        printLog(message, level: .debug)
    }
}

enum Level {
    case debug, info, warning, error
}
