//
//  ViewController.swift
//  SnapKitDemo
//
//  Created by NO SEONGGYEONG on 4/22/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let redView = UIView()
    private let blueView = UIView()
    private let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SnapKit Demo"
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        greenView.backgroundColor = .green
        
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(greenView)
    }
    
    func setupConstraints() {
        redView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(100)
        }
        
        blueView.snp.makeConstraints { make in
            make.top.equalTo(redView)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(redView)
        }
        
        greenView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
    }
}

#Preview {
    UINavigationController(rootViewController: ViewController())
}
