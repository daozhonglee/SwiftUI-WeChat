//
//  DiscoverRow.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// DiscoverRow: 发现页面列表行组件
// 负责展示发现页面中的单个功能项，包括：
// 1. 使用 VStack 和 HStack 实现垂直和水平布局
// 2. 统一的高度和内边距设置
// 3. 支持自定义图标和标题
// 4. 右侧显示统一的箭头指示器
struct DiscoverRow: View {
    // 功能项的图标名称
    let icon: String
    // 功能项的标题文本
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            // HStack 用于水平布局图标、标题和箭头
            HStack(spacing: 12) {
                // 功能图标，保持原始颜色
                Image(icon)
                    .renderingMode(.original)
                
                // 功能标题
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                
                Spacer()
                
                // 右侧箭头指示器
                Image("cell_detail_indicator")
                    .renderingMode(.original)
            }
            .padding()
        }
        .frame(height: 54)
    }
}

struct DiscoverRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverRow(icon: "discover_moment", title: "朋友圈")
    }
}
