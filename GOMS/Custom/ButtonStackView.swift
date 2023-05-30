//
//  ButtonStackView.swift
//  GOMS
//
//  Created by 신아인 on 2023/05/30.
//

import UIKit
import SnapKit
import Then

class ButtonStackView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addView()
        setLayout()
    }
    
    private let status = CustomStackView()
    
    private let forwordButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        $0.tintColor = .orange
    }
    
    func addView(){
        addSubview(status)
        status.addSubview(forwordButton)
    }
    
    private func setLayout() {
        status.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(70)
            $0.centerX.centerY.equalToSuperview()
        }
        forwordButton.snp.makeConstraints {
            $0.centerY.equalTo(status)
            $0.trailing.equalTo(status.snp.trailing).offset(-20)
        }
    }
}
