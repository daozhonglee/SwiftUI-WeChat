//
//  ContactHome.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

// ContactHome: 联系人主页视图
// 负责展示联系人列表，并处理下拉和上拉时的背景效果
struct ContactHome : View {
    var body: some View {
        // ZStack 用于层叠布局背景和列表内容
        ZStack {
            // VStack 用于垂直布局背景色和占位空间
            VStack {
                // 设置下拉时显示的灰色背景
                // frame(height:) 限制背景高度为 300 点
                Color("light_gray").frame(height: 300)
                
                // Spacer 用于填充剩余空间
                // 防止列表上拉到底时露出背景色
                Spacer()
            }
            
            // 联系人列表组件
            // 放置在 ZStack 的顶层显示
            ContactList()
        }
    }
}

// 预览提供者
struct ContactHome_Previews : PreviewProvider {
    static var previews: some View {
        // 预览联系人主页组件
        ContactHome()
    }
}
