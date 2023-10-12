//
//  DatabaseManager.swift
//  Zupper
//
//  Created by nithish-17632 on 03/09/23.
//

import Foundation

import SQLite3
import UIKit


class DatabaseManager{
    var db:OpaquePointer?
    private let dbPath = "Zupper.sqlite"
    let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private static var instance: DatabaseManager?
    private init() {
        let userD = UserDefaults.standard
//        userD.set(1, forKey: "imageID")
        self.db = createDB()
        
    }
    
    static func getInstance() -> DatabaseManager {
        if instance == nil {
            instance = DatabaseManager()
        }
        return instance!
    }
    
    
    private func createDB() -> OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        print(filePath)
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK
        {
            print("can't open database")
            return nil
        }
        else
        {
            print("Successfully created connection to database at \(dbPath)")
            return db
        }
    }
}
