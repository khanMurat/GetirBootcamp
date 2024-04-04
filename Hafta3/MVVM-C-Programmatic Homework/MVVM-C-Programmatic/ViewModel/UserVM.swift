//
//  UserVM.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import RxMoya
import RxSwift

class UserVM {
    
    func fetchRemoteUsers() -> Observable<[User]> {
        return .create { observer in
            ForumNetworkManager.shared.getUsers()
                .subscribe { users in
                    observer.onNext(users)
                } onFailure: { error in
                    print(error)
                    observer.onError(error)
                }
        }
    }
}
