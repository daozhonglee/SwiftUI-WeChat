//
//  ActivityIndicator.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/3/22.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// ActivityIndicator: 活动指示器组件
// 将 UIKit 的 UIActivityIndicatorView 包装为 SwiftUI 组件
// 用于显示加载中、处理中等状态的旋转动画指示器
struct ActivityIndicator: UIViewRepresentable {
    // 指示器样式，可选 large 或 medium
    let style: UIActivityIndicatorView.Style
    
    // 创建 UIActivityIndicatorView 实例
    func makeUIView(context: Context) -> UIActivityIndicatorView  {
        return UIActivityIndicatorView(style: style)
    }
    
    // 更新视图状态，这里启动动画
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}

// 预览提供者
struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(style: .medium)
    }
}
