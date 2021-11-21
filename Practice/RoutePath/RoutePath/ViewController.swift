//
//  ViewController.swift
//  RoutePath
//
//  Created by wargi_p on 2021/11/07.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ASPM


class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let v = UITableView()
        return v
    }()
    
    let subject = BehaviorRelay<Int>(value: 10)
    
    @objc public func f() {
        
    }
    
    static public var re: Int?
    
    //경로선 테스트
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        LogUtil.d(ASPM().text)
    }
}
