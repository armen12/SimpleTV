//
//  GitRepoItemViewModel.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 15.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
final class GitRepoItemViewModel {
    var title: String
    var description: String
    var imageUrl: String
    var gitRepo: GitRepoModel
    init(gitRepo: GitRepoModel ) {
        self.gitRepo = gitRepo
        self.title = gitRepo.name ?? ""
        self.description = gitRepo.description ?? ""
        self.imageUrl = gitRepo.owner.avatarURL ?? ""
    }
}
