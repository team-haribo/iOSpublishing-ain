//
//  HomeViewController.swift
//  GOMS
//
//  Created by 신아인 on 2023/05/29.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private let gomsLabel = UILabel().then {
        $0.text = "GOMS"
        $0.textColor = .orange
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let profileButton = UIButton().then {
        $0.setImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        $0.tintColor = .orange
    }
    
    private let mainLabel = UILabel().then {
        $0.text = "간편하게\n수요외출제를\n이용해 보세요!"
        $0.numberOfLines = 3
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 25)
    }
    
    private let mainImage = UIImageView().then {
        $0.image = UIImage(named: "people")
        $0.contentMode = .scaleAspectFit
    }
    
    private let outingButton = UIButton().then {
        $0.backgroundColor = .orange
        $0.layer.cornerRadius = 10
        
        let buttonText = "  외출금지  "
        let attributedText = NSAttributedString(string: buttonText, attributes: [
            .foregroundColor: UIColor.red,
            .backgroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 12)
        ])
        $0.setAttributedTitle(attributedText, for: .normal)
        
        $0.titleLabel?.layer.borderColor = UIColor.red.cgColor
        $0.titleLabel?.layer.borderWidth = 1
        $0.titleLabel?.layer.cornerRadius = 8
        $0.titleLabel?.layer.masksToBounds = true
        
        let edgeInset: CGFloat = 4.0
        $0.contentEdgeInsets = UIEdgeInsets(top: edgeInset, left: edgeInset, bottom: edgeInset, right: edgeInset)
    }
    
    private let statusStack = ButtonStackView()
    
    private let subTitleLabel = UILabel().then {
        $0.text = "현재 183명의 학생 중에서"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 13)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "48 명이 외출중이에요!"
        $0.textColor = .black
        
        if let text = $0.text {
            let attributedText = NSMutableAttributedString(string: text, attributes: [.font: UIFont.boldSystemFont(ofSize: 17)])
            let range = (text as NSString).range(of: "48")
            attributedText.addAttribute(.foregroundColor, value: UIColor.orange, range: range)
            $0.attributedText = attributedText
        }
        $0.font = .systemFont(ofSize: 17)
    }
    
    private let lateLabel = UILabel().then {
        $0.text = "지각의 전당"
        $0.textColor = .darkGray
        $0.font = .boldSystemFont(ofSize: 22)
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let myProfileStack = ButtonStackView()
    
    let userImage = UIImageView().then {
        $0.image = UIImage(systemName: "person.crop.circle.fill")
        $0.tintColor = .gray
    }
    
    private let userNameLabel = UILabel().then {
        $0.text = "신아인"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    private let userNumberLabel = UILabel().then {
        $0.text = "2학년 2반 11번"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 13)
    }
    
    override func addView() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: "StudentCell")
        
        [gomsLabel,profileButton,mainLabel,mainImage,outingButton,
         statusStack,lateLabel,collectionView,myProfileStack].forEach{view.addSubview($0)}
        
        [subTitleLabel,titleLabel].forEach{statusStack.addSubview($0)}
        
        [userImage,userNameLabel,userNumberLabel].forEach{myProfileStack.addSubview($0)}
    }
    
    override func setLayout() {
        gomsLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(30)
        }
        profileButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-30)
        }
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(gomsLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(30)
        }
        mainImage.snp.makeConstraints {
            $0.top.equalTo(profileButton.snp.bottom).offset(25)
            $0.leading.equalTo(mainLabel.snp.trailing).offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.bottom.equalToSuperview().inset(500)
        }
        outingButton.snp.makeConstraints {
            $0.width.equalTo(150)
            $0.height.equalTo(45)
            $0.top.equalTo(mainLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(30)
        }
        statusStack.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(70)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(outingButton.snp.bottom).offset(50)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(statusStack.snp.top).offset(15)
            $0.leading.equalTo(statusStack.snp.leading).offset(20)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(statusStack.snp.leading).offset(20)
        }
        lateLabel.snp.makeConstraints {
            $0.top.equalTo(statusStack.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(lateLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(130)
        }
        myProfileStack.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(70)
            $0.bottom.equalToSuperview().offset(-125)
            $0.centerX.equalToSuperview()
        }
        userImage.snp.makeConstraints {
            $0.width.equalTo(45)
            $0.height.equalTo(45)
            $0.centerY.equalTo(myProfileStack)
            $0.leading.equalTo(myProfileStack.snp.leading).offset(15)
        }
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(myProfileStack.snp.top).offset(16)
            $0.leading.equalTo(userImage.snp.trailing).offset(10)
        }
        userNumberLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(userImage.snp.trailing).offset(10)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudentCell", for: indexPath) as! StudentCollectionViewCell
        
        let nameLabel: String
        let numberLabel: String
        
        if indexPath.item == 0 {
            nameLabel = "신아인"
            numberLabel = "2211"
        }
        else if indexPath.item == 1 {
            nameLabel = "서주미"
            numberLabel = "2209"
        }
        else {
            nameLabel = "김주은"
            numberLabel = "2102"
        }
        
        cell.nameLabel.text = nameLabel
        cell.numberLabel.text = numberLabel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
}
