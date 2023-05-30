//
//  BaseViewController.swift
//  GOMS
//
//  Created by 신아인 on 2023/05/29.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
    }
    
    func addView(){}
    func setLayout(){}
}
