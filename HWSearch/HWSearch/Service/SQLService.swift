//
//  SQLService.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import Foundation
import SQLite

class LocalDataSource {
    
    static let shared = LocalDataSource()
    
    private var database : Connection!
    
    let wordsTable = Table("Words")
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    
    private init() {
        
        getDatabasePath()
        
    }
    
    private func getDatabasePath(){
        
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            
            self.database = try Connection("\(path)/db.sqlite3")
            
            createTable()
        }catch{
            print("DEBUG : Error when database connection \(error.localizedDescription)")
        }
    }
    
    private func createTable(){
        
        do{
            let existingTables = try database.scalar("SELECT name FROM sqlite_master WHERE type='table' AND name='Words'")
            if existingTables != nil{
                print("Table already exists")
                return
            }
        }catch{
            print("Error checking for existing table: \(error)")
        }
        
        do{
            try database.run(wordsTable.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
            })
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    func insertWord(model:DatabaseModel){
        
        let insertOrUpdate = wordsTable.insert(or: .replace,
                                               name <- model.name
        )
        do{
            try database.run(insertOrUpdate)
            print("Inserted word successfully.")
        }catch{
            print("DEBUG : Error when insert word to table \(error.localizedDescription)")
        }
    }
    
    func getLastWords() -> [DatabaseModel] {
        do {
            let query = wordsTable.order(id.desc).limit(5)
            return try database.prepare(query).map { row in
                DatabaseModel(name: row[name])
            }
        } catch {
            print("DEBUG: Error when fetching last words \(error.localizedDescription)")
            return []
        }
    }
}
