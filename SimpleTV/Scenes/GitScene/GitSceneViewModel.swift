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
import RealmSwift


class GitSceneViewModel: ViewModelType{
    struct Input {
        let updateTriger: Driver<Void>
        let selectCell: Driver<IndexPath>
        let noFilterButtonTap: Driver<Void>
        let filterButtonTap: Driver<Void>
    }
    
    struct Output{
        let gitRepos: Driver<[RealmGitRepoItemViewModel]>
        let selectRepoIndex: Driver<(IndexPath)>
        let filterButtonTap: Driver<[RealmGitRepoItemViewModel]>
    }
    
    private let navigator: MainScreenNavigation
    private let network: GitRepoServicesProtocol
    let realm = try! Realm()
    
    init(navigator: MainScreenNavigation, network: GitRepoServicesProtocol) {
        self.navigator = navigator
        self.network = network
    }
    private func getData<T:Object>(ofType: T.Type) -> [T]? {
        let saveObjects =  realm.objects(ofType)
        return Array(saveObjects)
    }
    func saveData(repoArray: [RealmGitRepoItemViewModel]) -> Void{
        let realmArray = self.getData(ofType: RealmGitRepoItemViewModel.self) ?? []
        for saveRepo in realmArray{
            for repo in repoArray{
                if saveRepo.title != repo.title{
                    try! realm.write {
                        realm.add(repo)
                    }
                }
            }
        }
    }
    func changeTV(input: Input){}
    
    func transform(input: Input) -> Output {
        let network  = self.network.getAllRepo().asObservable()
        
        let gitRepos = input.updateTriger.flatMapLatest{
            return network
//                .debug("My shit")
                .asDriver(onErrorJustReturn: [])
                .map { $0.map { RealmGitRepoItemViewModel(gitRepo: $0) }
            }
        }
        let selectRepoIndex = input.selectCell.withLatestFrom(gitRepos){
            (indexPath, gitRepos) -> (IndexPath) in
            gitRepos[indexPath.row].isSelected = true
            //            let selectedRepo = gitRepos[indexPath.row].gitRepo
            //            self.navigator.toSingleRepo(model: selectedRepo)
            //            let selectedItem = gitRepos[indexPath.row].gitRepo
            
            return (indexPath)
        }
        let filterButtonTap = input.filterButtonTap.withLatestFrom(gitRepos) { (_, gitRepos) -> [RealmGitRepoItemViewModel] in
            return gitRepos.filter({!$0.isSelected})
        }
        
        
        return Output(gitRepos: gitRepos, selectRepoIndex: selectRepoIndex, filterButtonTap: filterButtonTap )
    }
}
