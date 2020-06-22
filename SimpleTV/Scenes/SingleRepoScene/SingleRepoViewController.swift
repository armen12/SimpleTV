//
//  SingleRepoViewController.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 06.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
import SDWebImage
import Hero


class SingleRepoViewController: UIViewController {
    var model: GitRepoModel?
    
    
    var currentView: SinglRepoView{
          return self.view as! SinglRepoView
      }
      

      
      override func loadView() {
          super.loadView()
          
        self.view = SinglRepoView()
      }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentView.descriptionLabel.text = model?.description
        self.currentView.titleLabel.text = model?.name
        self.currentView.image.sd_setImage(with: URL(string: (model?.owner.avatarURL)!))
        
    }

}
