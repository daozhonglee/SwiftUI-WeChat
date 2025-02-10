//
//  ContactList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// ContactList: 通讯录列表视图
// 负责展示微信通讯录界面，包括：
// 1. 使用 List 和 Section 实现分组展示的联系人列表
// 2. 支持按字母分组显示联系人
// 3. 整合搜索入口和新朋友入口
// 4. 通过 NavigationLink 实现到个人资料页面的导航
// 5. 使用 @State 管理联系人数据
struct ContactList: View {
    @State private var contacts: [Contact] = []
    
    var body: some View {
        List {
            Group {
                SearchEntry()
                
                ContactRow(icon: "contact_new_friend", title: "新的朋友", style: .system)
                
                ForEach(contacts) { contact in
                    Section(header: SectionHeader(title: contact.letter)) {
                        ForEach(contact.members) { member in
                            NavigationLink(destination: ProfileView()) {
                                ContactRow(
                                    icon: member.icon,
                                    title: member.name,
                                    style: .member
                                )
                            }
                        }
                    }
                }
            }
            .listRowInsets(.zero)
        }
        .listStyle(PlainListStyle())
        .onAppear(perform: load)
        .id(contacts.count)
    }
    
    func load() {
        guard contacts.isEmpty else { return }
        contacts = Contact.all
    }
    
    struct SectionHeader: View {
        let title: String
        
        var body: some View {
            ZStack(alignment: .leading) {
                Color("light_gray")
                    .frame(maxWidth: .infinity)
                
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.secondary)
                    .padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 18))
            }
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactList()
                .navigationBarTitle("通讯录", displayMode: .inline)
        }
    }
}
