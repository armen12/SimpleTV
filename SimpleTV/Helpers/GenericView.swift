////
////  GenericView.swift
////  SimpleTV
////
////  Created by Armen Nagapetyan on 08.06.2020.
////  Copyright © 2020 Armen Nagapetyan. All rights reserved.
////
//
import UIKit
protocol GenericViewProtocol{
    func initUI()
    func createConstraints()
}
//protocol GenericTableViewProtocol: GenericViewProtocol {
//    associatedtype modelType
//    func bind<T: Initializable>(model: T)
//}
public class GenericView: UIView, GenericViewProtocol {
    public required init() {
        super.init(frame: CGRect.zero)
        initUI()
        createConstraints()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
        createConstraints()
    }
    func initUI(){}
    func createConstraints(){}
}
public class GeneralTableViewCell: UITableViewCell, GenericViewProtocol{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {}
    
    func createConstraints() {}
    
}
