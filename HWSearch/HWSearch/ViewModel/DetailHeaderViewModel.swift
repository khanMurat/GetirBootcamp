//
//  DetailHeaderViewModel.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import Foundation

struct DetailHeaderViewModel {
    
    var model : WordDefinition?
    
    
    var wordName : String {
        return model?.word ?? ""
    }
    
    
    var phonetic : String {
        return model?.phonetic ?? ""
    }
    
}
