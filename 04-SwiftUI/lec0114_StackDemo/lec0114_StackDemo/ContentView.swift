//
//  ContentView.swift
//  lec0114_StackDemo
//
//  Created by SG on 1/14/25.
//

import SwiftUI

// 새로운 커스텀 세로 정렬값을 추가
extension VerticalAlignment {
    private enum OneThird: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}


struct ContentView: View {
    var body: some View {
        HStack(alignment: .oneThird){
            Rectangle()
                .fill(Color.green)
                .frame(width: 50, height: 200)
            Rectangle()
                .fill(Color.red)
                .alignmentGuide(.oneThird){ d in d[VerticalAlignment.top]}
                .frame(width: 50, height: 200)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 50, height: 200)
            Rectangle()
                .fill(Color.orange)
                .alignmentGuide(.oneThird) { d in d[VerticalAlignment.top]}
                .frame(width: 50, height: 200)
        }
        //         세로 정렬
        //         alianment 파라미터로
        VStack(alignment: .leading) {
            Text("This is some text")
            Text("This is longer text")
            Text("This is short")
        }
        
        // 텍스트를 기준으로 정렬하는 옵션 .lastTextBaseline
        // 반대 : firstTextBaseline
        HStack(alignment: .lastTextBaseline , spacing: 20) {
            Text("This is some text")
                .font(.largeTitle)
            Text("This is some much longer text")
                .font(.body)
            Text("This is short")
                .font(.headline)
        }
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.green)
                .frame(width: 120, height: 50)
            Rectangle()
                .fill(Color.red)
                .alignmentGuide(.leading, computeValue: { dimensions in
                                        dimensions.width / 3 })
//                    120 })

             


                .frame(width: 200, height: 50)
            Rectangle()
                .fill(Color.blue)
//                .alignmentGuide(.leading,
//                                computeValue: { dimentsions in
//                    dimentsions[.trailing] + 20
//                })
                .alignmentGuide(.leading, computeValue: {
                    d in d[HorizontalAlignment.trailing] + 20
                })

                .frame(width: 180, height: 50)
        }
        
    }
}

#Preview {
    ContentView()
}


