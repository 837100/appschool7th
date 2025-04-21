//
//  HippoPaymentsConfirmationViewController.swift
//  HippoPayments
//
//  Created by NO SEONGGYEONG on 4/18/25.
//

import UIKit

class HippoPaymentsConfirmationViewController: UIViewController {
    
    let successButton = UIButton()
    let failureButton = UIButton()
    let textLabel  = UILabel()
    let container = UIStackView()
    
    var onSuccess: (() -> Void)?
    var onFailure: ((HippoPaymentsError) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        isModalInPresentation = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        
        view.addConstraints(
            [.topMargin, .leftMargin, .bottomMargin, .rightMargin].map {
                NSLayoutConstraint(
                    item:container,
                    attribute: $0,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: $0,
                    multiplier: 1,
                    constant: 0
                )
            }
        )
        
        container.addArrangedSubview(textLabel)
        container.addArrangedSubview(successButton)
        container.axis = .vertical
        
        textLabel.text = "Your payment was successful\n\nPowered by HippoPayments 🦛"
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        successButton.setTitle("Success", for: .normal)
        successButton.setTitleColor(.systemBlue, for: .normal)
        successButton.addTarget(self, action: #selector(dismissButtonTouched), for: .primaryActionTriggered)
    }
    
    @objc func dismissButtonTouched() {
        viewControllerPresentationSource.dismiss(animated: true, completion: onSuccess)
    }
    
    @objc func failureButtonTouched() {
        viewControllerPresentationSource.dismiss(animated: true, completion: {
            self.onFailure?(HippoPaymentsError.genericError)
        })
    }
}
