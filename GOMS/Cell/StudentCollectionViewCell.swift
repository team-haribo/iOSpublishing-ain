//
//  StudentCollectionViewCell.swift
//  GOMS
//
//  Created by 신아인 on 2023/06/11.
//

import UIKit
import SnapKit
import Then

class StudentCollectionViewCell: UICollectionViewCell {
    
    let student = CustomStackView()
    
    let userImage = UIImageView().then {
        $0.image = UIImage(systemName: "person.crop.circle.fill")
        $0.tintColor = .gray
    }
    
    let nameLabel = UILabel().then {
        $0.text = "신아인"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let numberLabel = UILabel().then {
        $0.text = "2211"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.frame = bounds
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.frame = bounds
        addView()
        setLayout()
    }
    
    private func addView() {
        addSubview(student)
        [userImage,nameLabel,numberLabel].forEach{student.addSubview($0)}
    }
    
    private func setLayout() {
        student.snp.makeConstraints {
            $0.width.equalTo(95)
            $0.height.equalTo(125)
            $0.centerX.centerY.equalToSuperview()
        }
        userImage.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(50)
            $0.top.equalTo(student.snp.top).offset(15)
            $0.centerX.equalTo(student)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(userImage.snp.bottom).offset(12)
            $0.centerX.equalTo(student)
        }
        numberLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.centerX.equalTo(student)
        }
    }
}
