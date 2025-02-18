//
//  Typograpy.swift
//  TypograpyUIKit
//
//  Created by SG on 2/17/25.
//

import UIKit

// UIViewController는 swift로 따지면 view
class Typograpy: UIViewController {
    
    let myText: String = """
동해물과 백두산이 마르고 닳도록
하느님이 보우하사 우리 나라만세
"""
    let textView: UITextView = UITextView()
    let letterSpacing: CGFloat = 10.0
    let lineHeight: CGFloat = 8.0
    let fontSize: CGFloat = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let paragraphStyle: NSMutableParagraphStyle = .init()
        paragraphStyle.lineSpacing = lineHeight
        
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: self.fontSize),
            NSAttributedString.Key.kern : self.letterSpacing,
            NSAttributedString.Key.paragraphStyle : paragraphStyle
        ]
        
        let attributedString : NSAttributedString = NSAttributedString(string: myText, attributes: attributes)
        
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.textView.frame = self.view.frame
        self.textView.attributedText = attributedString
        self.view.addSubview(self.textView)
        
        NSLayoutConstraint.activate([
            self.textView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            self.textView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            self.textView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.textView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
            
        ])
        
    }
    
}

#Preview {
    Typograpy()
}
