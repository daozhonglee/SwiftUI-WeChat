//
//  HomeView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

// 导入 SwiftUI 框架，用于构建用户界面
import SwiftUI

// ChatHome: 聊天首页视图
// 负责展示聊天列表的容器视图，包含下拉刷新的背景和聊天列表
struct ChatHome: View {
    // 实现 View 协议要求的 body 计算属性
    // 返回视图的具体内容和结构
    var body: some View {
        // 使用 ZStack 叠加布局，背景和列表内容重叠显示
        ZStack {
            VStack {
                Color("light_gray").frame(height: 300) // 下拉时露出的灰色背景
                Spacer() // 避免到底部上拉出现背景
            }
            
            ChatList()
        }
    }
}

// ChatHome 的预览提供者
// 用于在 Xcode 预览画布中展示视图效果
struct ChatHome_Previews : PreviewProvider {
    static var previews: some View {
        ChatHome()
    }
}
