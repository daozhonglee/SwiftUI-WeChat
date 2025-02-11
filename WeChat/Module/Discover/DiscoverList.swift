//
//  DiscoverList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// DiscoverList: 发现页面列表视图
// 负责展示微信发现页面的功能列表，包括：
// 1. 使用 ScrollView 和 VStack 实现垂直滚动列表
// 2. 通过 Group 组件实现功能分组
// 3. 集成朋友圈、扫一扫、摇一摇等核心功能入口
// 4. 使用 NavigationLink 实现页面导航
// 5. 通过 Separator 和 Line 组件实现分隔线样式
struct DiscoverList: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Group {
                    NavigationLink(destination: MomentHome()) {
                        DiscoverRow(icon: "discover_moment", title: "朋友圈")
                    }
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_qrcode", title: "扫一扫")
                    Separator().padding(.leading, 52)
                    DiscoverRow(icon: "discover_shake", title: "摇一摇")
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_see", title: "看一看")
                    Separator().padding(.leading, 52)
                    DiscoverRow(icon: "discover_search", title: "搜一搜")
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_nearby", title: "附近的人")
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_shop", title: "购物")
                    Separator().padding(.leading, 52)
                    DiscoverRow(icon: "discover_game", title: "游戏")
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_miniprogram", title: "小程序")
                    Line()
                }
            }
            .background(Color("cell"))
        }
        .background(Color("light_gray"))
    }
    
  
}
struct Line: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color("light_gray"))
            .frame(height: 8)
    }
}

struct DiscoverList_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverList()
    }
}
