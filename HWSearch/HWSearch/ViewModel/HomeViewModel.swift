//
//  HomeViewModel.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate : AnyObject {
    
    func didReceiveTableData(_ values : [DatabaseModel])
    func didFailWithError(_ error: NetworkError)
}

class HomeViewModel {
    
    weak var delegate : HomeViewModelDelegate?
    
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
    
    func getRecentWordFromDatabase(){
        self.delegate?.didReceiveTableData(LocalDataSource.shared.getLastWords())
    }
}
