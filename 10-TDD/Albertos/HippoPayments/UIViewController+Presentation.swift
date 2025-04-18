//
//  UIViewController+Presentation.swift
//  HippoPayments
//
//  Created by NO SEONGGYEONG on 4/18/25.
//

import UIKit

extension UIViewController {
    var viewControllerPresentationSource: UIViewController {
        guard let presentedViewController =  self.presentedViewController else { return self }
        
        return presentedViewController.viewControllerPresentationSource
    }
}
