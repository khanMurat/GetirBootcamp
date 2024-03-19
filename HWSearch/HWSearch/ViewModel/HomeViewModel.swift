//
//  HomeViewModel.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import Foundation
import UIKit

class HomeViewModel {
    
    func checkSearchText(searchText: String,completion : (Bool) -> Void) {
        
        guard !searchText.isEmpty else {
            completion(false)
            return}
        
        completion(true)
    }
    
    func addRecentWordToDatabase(recentValue:String){
        
        let databaseModel = DatabaseModel(name: recentValue)
        
        LocalDataSource.shared.insertWord(model: databaseModel)
    }
    
    func getRecentWordFromDatabase() -> [DatabaseModel]{
        
       return LocalDataSource.shared.getLastWords()
    }
}
