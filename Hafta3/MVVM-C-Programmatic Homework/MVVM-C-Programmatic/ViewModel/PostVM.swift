//
//  PostVM.swift
//  MVVM-C-Programmatic
//
//  Created by Murat on 4.04.2024.
//

import RxMoya
import RxSwift

class PostVM {
    
    func fetchUsersPost(id:Int) -> Observable<[Post]> {
        
        return .create { observer in
            ForumNetworkManager.shared.getUserPost(for: id).subscribe { posts in
                observer.onNext(posts)
            } onFailure: { error in
                print(error)
                observer.onError(error)
            }
        }
        
    }
    
}
