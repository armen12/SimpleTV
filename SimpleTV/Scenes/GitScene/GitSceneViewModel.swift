//
//  GitSceneViewModel.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 05.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class GitSceneViewModel: ViewModelType{
    struct Input {
        let updateTriger: Driver<Void>
        let selectCell: Driver<IndexPath>
    }
    
    struct Output{
        let gitRepos: Driver<[GitRepoModel]>
        let selectRepoIndex: Driver<(IndexPath, GitRepoModel)>
    }
    
    private let navigator: MainScreenNavigation
    private let network: GitRepoServicesProtocol
    
    init(navigator: MainScreenNavigation, network: GitRepoServicesProtocol) {
        self.navigator = navigator
        self.network = network
    }
    
    func transform(input: Input) -> Output {
        let gitRepos = input.updateTriger.flatMapLatest{
            return self.network.getAllRepo()
                .asDriver(onErrorJustReturn: [])
        }
        let selectRepoIndex = input.selectCell.withLatestFrom(gitRepos){
            (indexPath, gitRepos) -> (IndexPath, GitRepoModel) in
            let selectedItem = gitRepos[indexPath.row]
            return (indexPath, selectedItem)
        }
        return Output(gitRepos: gitRepos, selectRepoIndex: selectRepoIndex )
    }
}
