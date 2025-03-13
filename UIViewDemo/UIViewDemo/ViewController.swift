//
//  ViewController.swift
//  UIViewDemo
//
//  Created by NO SEONGGYEONG on 3/13/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupStackView()
//        // 버튼
//        setupButton()
//        // 스위치
//        setupSwitch()
//        // 스테퍼
//        setupSteper()
//        // 슬라이더
//        setupSlider()
        
    }
    func setupStackView() {
        let stackView = UIStackView()
        stackView.backgroundColor = .lightGray
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label1 = UILabel()
        label1.backgroundColor = .systemRed
        label1.text = "Label 1"
        
        let label2 = UILabel()
        label2.backgroundColor = .systemBlue
        label2.text = "Label 2"
        
        let label3 = UILabel()
        label3.backgroundColor = .systemGreen
        label3.text = "Label 3"
        
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20),
            stackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20),
            stackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
    }
}


#Preview {
    ViewController()
}


