//
//  SearchEntry.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/11/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

// SearchEntry: 搜索入口组件
// 实现了一个可点击的搜索框，点击后会以模态方式展示搜索主页
struct SearchEntry: View {
    // @State 属性包装器用于管理视图的本地状态
    // 当 isSearchPresented 改变时，SwiftUI 会自动重新渲染相关视图
    @State private var isSearchPresented: Bool = false
    
    var body: some View {
        // Button 组件用于处理点击事件
        // action 闭包中使用 toggle() 切换 isSearchPresented 的布尔值
        Button(action: { self.isSearchPresented.toggle() }) {
            // VStack 用于垂直方向的视图布局
            VStack {
                Spacer() // 顶部弹性空间
                // HStack 用于水平方向的视图布局，spacing 设置子视图间距
                HStack(spacing: 4) {
                    Spacer() // 左侧弹性空间
                    // SF Symbols 系统图标，设置为可缩放并指定尺寸
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .foregroundColor(.secondary) // 使用次要颜色
                    // 搜索文本，设置字体和颜色
                    Text("搜索")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                    Spacer() // 右侧弹性空间
                }
                Spacer() // 底部弹性空间
            }
            // 设置搜索框的背景色和圆角
            .background(Color("search_corner_background"))
            .cornerRadius(6)
            // 使用 EdgeInsets 设置内边距
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .background(Color("light_gray")) // 按钮整体背景色
        // sheet 修饰符用于模态展示搜索主页
        // 使用 $isSearchPresented 双向绑定控制显示状态
        .sheet(isPresented: $isSearchPresented, content: { SearchHome() })
    }
}

// 预览提供者，用于在 Xcode 预览画布中展示组件
struct SearchEntryView_Previews: PreviewProvider {
    static var previews: some View {
        SearchEntry()
            .previewLayout(.fixed(width: 414, height: 44)) // 设置预览尺寸
    }
}
