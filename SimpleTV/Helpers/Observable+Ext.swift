//
//  Observable+Ext.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 06.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType where E == Bool {
    /// Boolean not operator
    public func not() -> Observable<Bool> {
        return self.map(!)
    }
    
}

extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}

extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<E> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<E> {
        return asDriver { error in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
