//
//  GitRepoService.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 05.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol GitRepoServicesProtocol {
    func getAllRepo() -> Single<[RealmGitRepoModel]>
}
class GitRepoServices: GitRepoServicesProtocol{
    let disposeBag = DisposeBag()
    let gitRepoProvider = MoyaProvider<GitRepoAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func getAllRepo() -> Single<[RealmGitRepoModel]> {
        return  gitRepoProvider.rx
            .request(.getAllRepo)
            .filterSuccessfulStatusCodes()
            .map([RealmGitRepoModel].self)
        
    }
}
