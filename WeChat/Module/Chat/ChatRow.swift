//
//  ChatRow.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// ChatRow: 聊天列表行组件
// 用于展示单个聊天会话的基本信息，包括头像、名称、最后消息和时间
struct ChatRow: View {
    // 当前聊天会话的数据模型
    let chat: Chat
    
    var body: some View {
        // HStack 用于水平布局头像和文本信息
        HStack(spacing: 12) {
            // 头像图片
            // renderingMode(.original) 保持图片原始颜色
            // resizable() 允许图片大小可调整
            Image(chat.sender.icon)
                .renderingMode(.original)
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(8)

            // VStack 用于垂直布局名称和最后消息
            VStack(alignment: .leading, spacing: 5) {
                // HStack 用于水平布局名称和时间
                HStack(alignment: .top) {
                    // 发送者名称
                    Text(chat.sender.name)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.primary)
                    Spacer()
                    // 最后消息时间
                    Text(chat.time)
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                }

                // 最后一条消息描述
                // lineLimit(1) 限制文本只显示一行
                Text(chat.desc)
                    .lineLimit(1)
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
            }
        }
        // 设置整体内边距
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
    }
}

// 预览提供者
struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        // 使用示例数据预览组件
        ChatRow(chat: .swiftui)
    }
}
