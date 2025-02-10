//
//  MeHome.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

// MeHome: 个人页面主视图
// 负责展示微信个人中心界面，包括：
// 1. 使用 ZStack 实现背景和内容的层叠布局
// 2. 通过 VStack 实现背景色的垂直分层
// 3. 集成 MeList 组件展示个人信息和功能列表
// 4. 实现下拉时的背景色过渡效果
struct MeHome : View {
    var body: some View {
        ZStack {
            VStack {
                Color("cell").frame(height: 300) // 下拉时露出的白色背景
                Color("light_gray") // 其余区域是灰色背景
            }
            
            MeList()
        }
    }
}

struct MeHome_Previews : PreviewProvider {
    static var previews: some View {
        MeHome()
    }
}
