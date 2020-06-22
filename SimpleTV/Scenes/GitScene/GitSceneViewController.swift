//
//  GitSceneViewController.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 04.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import DifferenceKit

class GitSceneViewController: UIViewController {
    var currentView: GitSceneView{
        return self.view as! GitSceneView
    }
    
    let disposeBag = DisposeBag()
    var viewModel: GitSceneViewModel!
    
    override func loadView() {
        super.loadView()
        
        self.view = GitSceneView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.bindViewModel()
    }
    
    func bindViewModel(){
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = GitSceneViewModel.Input(updateTriger: viewWillAppear, selectCell: currentView.tableView.rx.itemSelected.asDriver(), noFilterButtonTap: self.currentView.withoutFilterButton.rx.tap.asDriver(), filterButtonTap: self.currentView.withFilterButton.rx.tap.asDriver() )
        
        let output = viewModel.transform(input: input)
        output.gitRepos.drive(currentView.tableView.rx.items(cellIdentifier: GitSceneTableViewCell.reuseID, cellType: GitSceneTableViewCell.self)){tv, viewModel, cell in
            cell.bind(viewModel)
        }
        .disposed(by: disposeBag)
        
        //        output.gitRepos.drive(onNext: { (some) in
        //            self.currentView.updateTableView()
        //        })
        //            .disposed(by: disposeBag)
        //        output.selectRepoIndex
        //            .drive()
        //            .disposed(by: disposeBag)
         output.selectRepoIndex.drive(onNext: { (index) in
            self.currentView.tableView.reloadRows(at: [index], with: .none)
            })
            .disposed(by: disposeBag)
        
//        output.filterButtonTap.drive(onNext:{ repos in
//            self.currentView.tableView.reloadData()
//        })
//            .disposed(by: disposeBag)
        
    }
}
