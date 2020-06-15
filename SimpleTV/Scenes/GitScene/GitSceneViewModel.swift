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
        let gitRepos: Driver<[GitRepoItemViewModel]>
        let selectRepoIndex: Driver<(IndexPath)>
    }
    
    private let navigator: MainScreenNavigation
    private let network: GitRepoServicesProtocol
    
    init(navigator: MainScreenNavigation, network: GitRepoServicesProtocol) {
        self.navigator = navigator
        self.network = network
    }
    
    func transform(input: Input) -> Output {
        let network  = self.network.getAllRepo().asObservable()
        let gitRepos = input.updateTriger.flatMapLatest{
            return network
                .asDriver(onErrorJustReturn: [])
                .map { $0.map { GitRepoItemViewModel(gitRepo: $0) } }
            
        }
        let selectRepoIndex = input.selectCell.withLatestFrom(gitRepos){
            (indexPath, gitRepos) -> (IndexPath) in
//             gitRepos[indexPath.row].gitRepo
            gitRepos[indexPath.row].gitRepo.isSelectedCell = true
//            let selectedItem = gitRepos[indexPath.row].gitRepo
            
            return (indexPath)
        }
        
        return Output(gitRepos: gitRepos, selectRepoIndex: selectRepoIndex )
    }
}
