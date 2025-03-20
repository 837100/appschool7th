//
//  CustomCell.swift
//  ToDoUIKit
//
//  Created by NO SEONGGYEONG on 3/20/25.
//

import UIKit

class CustomCell: UITableViewCell {
    // aniamlImageView: 동물의 이미지를 표시하는 UIImageView 입니다.
    let animalImageView = UIImageView()
    // nameLabel: 동물의 이름을 표시하는 UILabel입니다.
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 이미지 뷰의 크기와 위치를 설정합니다.
        // Auto Layout 제약 조건을 사용하기 위해 translatesAutoresizingMaskIntoConstraints를 false로 설정합니다.
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 셀의 contentView에 UI요소들을 추가합니다
        contentView.addSubview(animalImageView)
        contentView.addSubview(nameLabel)
        
        // Auto LAyout 제약 조건을 설정합니다.
        NSLayoutConstraint.activate([
            // animalImageView의 제약 조건
            
        ])
    }

}
