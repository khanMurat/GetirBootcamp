//
//  CommentVM.swift
//  MVVM-C-Programmatic
//
//  Created by Murat on 4.04.2024.
//

import Foundation
import RxMoya
import RxSwift

class CommentVM {
    
    func fetchPostsComments(id:Int) -> Observable<[Comment]> {
        
        return .create { observer in
            ForumNetworkManager.shared.getComments(for: id).subscribe { comments in
                observer.onNext(comments)
            } onFailure: { error in
                print(error)
                observer.onError(error)
            }
        }
    }
}
