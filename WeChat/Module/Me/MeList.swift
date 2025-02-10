//
//  MeList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// MeList: 个人中心列表视图
// 负责展示微信个人中心的功能列表，包括：
// 1. 使用 ScrollView 和 VStack 实现垂直滚动列表
// 2. 通过 Group 组件实现功能分组
// 3. 集成个人信息头部组件
// 4. 展示支付、收藏、相册等核心功能入口
// 5. 使用 Separator 和 Line 组件实现分隔线样式
struct MeList: View {
    var body: some View {
        // ScrollView 实现列表滚动
        ScrollView {
            // VStack 垂直布局所有功能项
            VStack(spacing: 0) {
                // 个人信息头部分组
                Group {
                    Header()
                    Line()
                }
                // 支付功能分组
                Group {
                    MeRow(icon: "me_pay", title: "支付")
                    Line()
                }
                // 收藏、相册、卡包、表情分组
                Group {
                    MeRow(icon: "me_favorite", title: "收藏")
                    Separator().padding(.leading, 52)
                    MeRow(icon: "me_photo_album", title: "相册")
                    Separator().padding(.leading, 52)
                    MeRow(icon: "me_bank_card", title: "卡包")
                    Separator().padding(.leading, 52)
                    MeRow(icon: "me_emoji", title: "表情")
                    Line()
                }
                // 设置分组
                Group {
                    MeRow(icon: "me_setting", title: "设置")
                    Line()
                }
            }
            .background(Color("cell"))
        }
    }
    
    // Header: 个人信息头部组件
    // 负责展示用户头像、昵称等个人信息
    struct Header: View {
        @State var me = Member.me
        
        var body: some View {
            VStack(spacing: 36) {
                HStack {
                    Spacer()
                    Image(systemName: "camera.fill")
                        .padding(.trailing, 4)
                }
                .frame(height: 44)
                
                HStack(spacing: 20) {
                    Image(me.icon)
                        .resizable()
                        .cornerRadius(6)
                        .frame(width: 62, height: 62)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(me.name)
                            .font(.system(size: 22, weight: .medium))
                        
                        HStack {
                            Text("微信号：\(me.identifier ?? "")")
                                .foregroundColor(Color.secondary)
                            
                            Spacer()
                            
                            Image("me_qrcode")
                            Image("cell_detail_indicator")
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 40, trailing: 16))
        }
    }
}

struct MeList_Previews: PreviewProvider {
    static var previews: some View {
        MeList()
    }
}
