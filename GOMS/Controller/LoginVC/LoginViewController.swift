//
//  LoginViewController.swift
//  GOMS
//
//  Created by 신아인 on 2023/06/12.
//

import UIKit
import GAuthSignin

class LoginViewController: BaseViewController {
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    private let mainLabel = UILabel().then {
        $0.text = "간편한 수요 외출제 서비스"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 20)
        
        if let text = $0.text {
            let attributedText = NSMutableAttributedString(string: text)
            let range = (text as NSString).range(of: "수요 외출제")
            attributedText.addAttribute(.foregroundColor, value: UIColor.orange, range: range)
            $0.attributedText = attributedText
        }
    }
    
    private let subLabel = UILabel().then {
        $0.text = "앱으로 간편하게 GSM의\n수요 외출제를 이용해 보세요"
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 17)
    }
    
    let gauthButton = GAuthButton(auth: .signup, color: .colored, rounded: .default)
    let clientID = "my_client_id"
    let redirectURI = "my_redirect_uri"
    var viewModel: GAuthViewModel?
    
    override func addView() {
        [logoImage, mainLabel, subLabel, gauthButton].forEach{view.addSubview($0)}
        setupViewModel()
    }
    
    override func setLayout() {
        logoImage.snp.makeConstraints {
            $0.width.height.equalTo(110)
            $0.top.equalToSuperview().offset(120)
            $0.centerX.equalToSuperview()
        }
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        subLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        gauthButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(80)
            $0.height.equalTo(60)
        }
    }
    
    func setupViewModel() {
        viewModel = GAuthViewModel(clientID: clientID, redirectURI: redirectURI)
    
        if let completion = viewModel?.handleGAuthCode {
            gauthButton.prepare(
                clientID: viewModel?.clientID ?? "",
                redirectURI: viewModel?.redirectURI ?? "",
                presenting: self,
                completion: { code in
                    completion(code)
                }
            )
        }
    }
}
