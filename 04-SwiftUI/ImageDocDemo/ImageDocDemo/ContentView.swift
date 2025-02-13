//
//  ContentView.swift
//  ImageDocDemo
//
//  Created by SG on 1/16/25.
//
// TODO: 필터 효과가 누르면 계속 중첩되는데 필터 초기화 버튼을 만들어서 필터를 사용하기 전으로 초기화 하는 기능 만들기.

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @Binding var document: ImageDocDemoDocument
    @State private var ciFilter = CIFilter.sepiaTone()
    
    let context = CIContext()
    
    var body: some View {
        VStack {
            Image(uiImage: document.image)
                .resizable()
                .aspectRatio(contentMode: .fit )
                .padding()
            Button(action: {
                filterImage()
            }, label: {
                Text("Filter Image")
            })
            Button(action: {
                resetImage()
            }, label: {
                Text("Reset Image")
            })
            .padding()
        }
        
    }
    
    func filterImage() {
        ciFilter.intensity = Float(1.0)
        
        let ciImage = CIImage(image: document.image)
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        
        guard let outputImage = ciFilter.outputImage else { return }
        
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            document.image = UIImage(cgImage: cgImage)
        }
    }
    
    func resetImage() {
        print("reset Image")
    }
}

#Preview {
    ContentView(document: .constant(ImageDocDemoDocument()))
}
