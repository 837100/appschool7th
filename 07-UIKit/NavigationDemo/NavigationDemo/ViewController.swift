//
//  ViewController.swift
//  NavigationDemo
//
//  Created by NO SEONGGYEONG on 3/18/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "네비게이션 타이틀"
        
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.tintColor = .white
        // isTranslucent를 사용하면 투명도
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        // 네비게이션바의 큰 타이틀 설정
        //        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = .systemBlue
        setupButton()
        
        
        //        // iOS 15 이상에서는 UINavigationBarAppearance 사용
        //        let appearance = UINavigationBarAppearance()
        //        // 투명한 배경 설정
        //        appearance.configureWithOpaqueBackground()
        //        // 배경색 설정
        //        appearance.backgroundColor = .systemBlue
        //        // 타이틀 색상
        //        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        //
        //        // 네비게이션 바에 적용 (평상시)
        //        self.navigationController?.navigationBar.standardAppearance = appearance
        //        // 스와이프로 스크롤 할 때
        //        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        //        self.navigationController?.navigationBar.tintColor = .white // 아이템 색상
        //
        
    }
    
    func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("다음 화면으로", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addAction(UIAction { [weak self] _ in
            // 다음 화면으로 이동 세그웨이 실행
            self?.performSegue(withIdentifier: "showDetailSegue", sender: nil)
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue",
           let vc = segue.destination as? SecondViewController{
            vc.title = "다음 화면"
            vc.view.backgroundColor = .systemRed
        }
    }
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        let VC = SecondViewController()
    //        //        VC.view.backgroundColor = . systemYellow
    //        //        VC.title = "서브 타이틀"
    //        self.navigationController?.pushViewController(VC, animated: true)
    //    }
}

#Preview {
    //    UINavigationController(rootViewController: ViewController())
    
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
