//
//  CustomViewController.swift
//  DelegateDemo
//
//  Created by NO SEONGGYEONG on 3/13/25.
//

import UIKit

// MARK: - 델리게이트 프로토콜 정의
// 커스텀 뷰 컨트롤러가 다른 클래스에 알릴 이벤트를 정의합니다.
protocol CustomViewControllerDeleagte: AnyObject {
    func didTapButton(withText text: String)
    
    func willAppear()
}

extension CustomViewControllerDeleagte {
    func willAppear() {
        
    }
}

class CustomViewController: UIViewController {
    
    weak var delegate: CustomViewControllerDeleagte?
    
    private let textField = UITextField()
    private let actionButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.willAppear()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        textField.borderStyle = .roundedRect
        textField.placeholder = "여기에 텍스트 입력"
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        actionButton.setTitle("전송", for: .normal)
        actionButton.addAction(UIAction { _ in
            self.buttonTapped()
        }, for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            textField.widthAnchor.constraint(equalToConstant: 250),
            
            actionButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant:20),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func buttonTapped() {
        let text = textField.text ?? ""
        delegate?.didTapButton(withText: text)
    }
}
