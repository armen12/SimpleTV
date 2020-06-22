//
//  GitRepoItemViewModel.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 15.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
import RealmSwift
import DifferenceKit
final class GitRepoItemViewModel {
    var title: String
    var description: String
    var imageUrl: String
    var gitRepo: GitRepoModel
    var isSelected: Bool = false
    init(gitRepo: GitRepoModel ) {
        self.gitRepo = gitRepo
        self.title = gitRepo.name ?? ""
        self.description = gitRepo.description ?? ""
        self.imageUrl = gitRepo.owner.avatarURL ?? ""
    }
}

class RealmGitRepoItemViewModel: Object {
    override static func primaryKey() -> String? { return "title" }
    @objc dynamic var title: String? = nil
    @objc dynamic var descriptionss: String? = nil
    @objc dynamic var imageUrl: String? = nil
    @objc dynamic var gitRepo: RealmGitRepoModel?
    @objc dynamic var isSelected: Bool = false
    convenience init(gitRepo: RealmGitRepoModel ) {
        self.init()
        self.gitRepo = gitRepo
        self.title = gitRepo.name
        self.descriptionss = gitRepo.descriptionss ?? ""
        self.imageUrl = gitRepo.owner!.avatarURL
    }
}
extension RealmGitRepoItemViewModel: Differentiable{}
