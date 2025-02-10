//
//  Separator.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/2/4.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// Separator: 分隔线组件
// 负责提供统一的分隔线样式，包括：
// 1. 基于 SwiftUI 的 Divider 组件封装
// 2. 支持自定义分隔线颜色
// 3. 提供默认的分隔线颜色配置
// 4. 用于列表项之间、区块之间的分隔
struct Separator: View {
    let color: Color
    
    var body: some View {
        Divider()
            .overlay(color)
            .padding(.zero)
    }
    
    init(color: Color = Color("separator")) {
        self.color = color
    }
}

struct Separator_Previews: PreviewProvider {
    static var previews: some View {
        Separator()
    }
}
