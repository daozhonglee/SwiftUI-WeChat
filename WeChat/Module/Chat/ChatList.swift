//
//  ChatList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// ChatList: 微信聊天列表视图
// 负责展示微信首页的聊天列表，包括：
// 1. 使用 ScrollView 和 LazyVStack 实现高性能的列表
// 2. 整合搜索入口组件 SearchEntry
// 3. 通过 NavigationLink 实现到聊天详情页面的导航
// 4. 使用 @State 管理聊天列表数据
struct ChatList: View {
    @State private var chats: [Chat] = []
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                SearchEntry()
                ForEach(chats) { chat in
                    NavigationLink(destination: ChatView(chat: chat)) {
                        ChatRow(chat: chat)
                    }
                    Separator().padding(.leading, 76)
                }
            }
            .background(Color("cell"))
        }
        .onAppear(perform: load)
    }
    
    func load() {
        guard chats.isEmpty else { return }
        chats = Chat.all
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatList()
                .navigationBarTitle("微信", displayMode: .inline)
        }
    }
}
