//
//  TabBarController.swift
//  TabDemo
//
//  Created by Jungman Bae on 3/19/25.
//

import UIKit

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    // 부모 클래스의 viewDidLoad를 호출하여 초기화
    super.viewDidLoad()
    print("TabBarController viewDidLoad")
    
      // 탭 바의 시각적 모양을 커스터마이징 하기 위해 appearance로 초기화
    let appearance = UITabBarAppearance()
    appearance.backgroundColor = .systemBackground

    // 질문: 만약 appearance를 만들지 않고 appearance의 요소들을 직접 넣을 수 있나요? 가능하다면 어떤 코드로?
    tabBar.standardAppearance = appearance
    tabBar.scrollEdgeAppearance = appearance

    setupTabBar()
  }

  func setupTabBar() {
    // 뷰 컨틀롤러 생성
    let firstVC = FirstViewController()
    let secondVC = SecondViewController()

    // 네비게이션 컨트롤러 생성
    // 질문: 네비게이션 컨트롤러로 만드는 이유는 페이지 전환 관리를 쉽게 하기 위해서 인가요?
    let firstNavController = UINavigationController(rootViewController: firstVC)
    let secondNavController = UINavigationController(rootViewController: secondVC)

    // 탭바 뷰 컨트롤러 배열 설정
    self.viewControllers = [firstNavController, secondNavController]

    // 탭바 아이템 설정
      // 질문 : 탭바 아이템의 title을 "첫번째","두번째"로 설정하였는데 First처럼 영어로 바뀐 이유는 FirstViewController의 title이 "First"로 설정이 되어서 인가요? 테스트를 위해 SecondViewController에도 title을 설정했을때는 처음 앱이 실행될때는 "두번째"로 표시되지만 SecondView화면을 클릭하면 SecondViewController가 로딩되어 밑의 글자가 Second로 바뀌는 것이 맞나요?
    firstNavController.tabBarItem = UITabBarItem(title: "첫번째", image: UIImage(systemName: "1.circle"), tag: 0)

    secondNavController.tabBarItem = UITabBarItem(title: "두번째", image: UIImage(systemName: "2.circle"), tag: 1)
  }
}

#Preview {
  UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}

//#Preview {
//  TabBarController()
//}


