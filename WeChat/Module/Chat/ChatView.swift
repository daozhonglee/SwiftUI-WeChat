//
//  ChatView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/8/11.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI
import Combine

// ChatView: 聊天界面主视图
// 负责展示聊天消息列表和发送消息的输入区域
struct ChatView: View {
    // 当前聊天的会话信息
    let chat: Chat
    
    var body: some View {
        // GeometryReader 用于获取视图的尺寸信息
        // 这里主要用于处理底部安全区域的适配
        GeometryReader { proxy in
            VStack(spacing: 0) {
                // 导航栏分隔线
                Separator(color: Color("navigation_separator"))
                
                // 消息列表组件
                MessageList()
                
                // 发送消息区域组件
                Send(proxy: proxy)
            }
            // 忽略底部安全区域，确保输入框紧贴底部
            .edgesIgnoringSafeArea(.bottom)
        }
        // 设置聊天界面背景色
        .background(Color("light_gray"))
        // 设置导航栏标题为聊天对象的名称
        .navigationBarTitle(chat.sender.name, displayMode: .inline)
    }
    
    // Send: 发送消息区域组件
    // 包含语音、文本输入框、表情和更多功能按钮
    struct Send: View {
        // GeometryProxy 用于获取安全区域信息
        let proxy: GeometryProxy
        
        // 文本输入框的状态管理
        @State private var text: String = ""
        
        var body: some View {
            VStack(spacing: 0) {
                // 输入区域顶部分隔线
                Separator(color: Color("chat_send_line"))
                
                ZStack {
                    // 输入区域背景色
                    Color("chat_send_background")
                    
                    VStack {
                        HStack(spacing: 12) {
                            // 语音输入按钮
                            Image("chat_send_voice")
                            
                            // 文本输入框
                            // 使用 $text 进行双向绑定
                            TextEditor(text: $text)
                                .frame(height: 40)
                                .background(Color("chat_send_text_background"))
                                .cornerRadius(4)
                            
                            // 表情按钮
                            Image("chat_send_emoji")
                            // 更多功能按钮
                            Image("chat_send_more")
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 12)
                        
                        Spacer()
                    }
                }
                // 设置输入区域高度，包含底部安全区域
                .frame(height: proxy.safeAreaInsets.bottom + 56)
            }
        }
    }
}

// 预览提供者
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        // 在导航视图中预览聊天界面
        NavigationView { ChatView(chat: .swiftui) }
    }
}
