//
//  MessageRow.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/4/19.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// MessageRow: 聊天消息行组件
// 负责展示单条聊天消息，包括：
// 1. 使用 HStack 实现头像和消息内容的水平布局
// 2. 根据 isMe 区分消息发送者和接收者的布局
// 3. 支持文本类型消息的展示
// 4. 包含头像和消息气泡子组件
struct MessageRow: View {
    // 消息数据模型
    let message: Message
    // 是否为当前用户发送的消息
    let isMe: Bool
    
    var body: some View {
        // HStack 用于水平布局头像和消息内容
        // alignment: .top 确保头像和消息顶部对齐
        HStack(alignment: .top, spacing: 8) {
            // 根据 isMe 决定头像和消息的位置
            if isMe { Spacer() } else { Avatar(icon: message.member.icon) }
            
            // 目前仅支持文本类型消息
            if message.type == .text { TextMessage(isMe: isMe, text: message.text ?? "") }
            
            if isMe { Avatar(icon: message.member.icon) } else { Spacer() }
        }
        .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
    }
    
    // Avatar: 头像子组件
    // 负责展示用户头像
    struct Avatar: View {
        let icon: String
        
        var body: some View {
            Image(icon)
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
    
    // TextMessage: 文本消息子组件
    // 负责展示文本消息内容和气泡背景
    struct TextMessage: View {
        let isMe: Bool
        let text: String
        
        var body: some View {
            HStack(alignment: .top, spacing: 0) {
                // 根据 isMe 决定气泡箭头的位置
                if !isMe { Arrow(isMe: isMe) }
                
                // 消息文本内容
                Text(text)
                    .font(.system(size: 17))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(background)
                
                if isMe { Arrow(isMe: isMe) }
            }
        }
        
        // 根据是否为自己发送的消息设置不同的背景色
        private var background: some View {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(Color(isMe ? "chat_me_background" : "chat_other_background"))
        }
    }
    
    // Arrow: 气泡箭头子组件
    // 负责展示消息气泡的箭头指示器
    struct Arrow: View {
        let isMe: Bool
        
        var body: some View {
            // 根据消息发送者设置箭头的方向和颜色
            Image("chat_" + (isMe ? "right" : "left"))
                .resizable()
                .frame(width: 6, height: 16)
                .foregroundColor(Color(isMe ? "chat_me_background" : "chat_other_background"))
        }
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(message: Message.all[0], isMe: false)
    }
}
