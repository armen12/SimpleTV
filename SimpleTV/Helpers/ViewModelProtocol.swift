//
//  ViewModelProtocol.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 04.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
protocol ViewModelType {
  associatedtype Input
  associatedtype Output
  func transform(input: Input) -> Output
}
