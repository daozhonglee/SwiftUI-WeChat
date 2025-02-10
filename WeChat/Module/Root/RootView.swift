//
//  RootView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

// RootView: 微信主视图
// 负责实现微信的主界面框架，包括：
// 1. 使用 TabView 实现底部标签栏
// 2. 集成聊天、通讯录、发现和我四个主要模块
// 3. 通过 NavigationView 实现顶部导航栏
// 4. 管理导航栏标题和按钮的动态显示
struct RootView: View {
    // 当前选中的标签页索引
    @State private var selection: Int = 0
    
    var body: some View {
        // NavigationView 用于实现顶部导航栏
        NavigationView {
            // TabView 实现底部标签栏，使用 selection 绑定当前选中项
            TabView(selection: $selection) {
                // 聊天主页
                ChatHome()
                    .tabItem { Item(type: .chat, selection: selection) }
                    .tag(ItemType.chat.rawValue)
                // 通讯录主页
                ContactHome()
                    .tabItem { Item(type: .contact, selection: selection) }
                    .tag(ItemType.contact.rawValue)
                // 发现主页
                DiscoverHome()
                    .tabItem { Item(type: .discover, selection: selection) }
                    .tag(ItemType.discover.rawValue)
                // 我的主页
                MeHome()
                    .tabItem { Item(type: .me, selection: selection) }
                    .tag(ItemType.me.rawValue)
            }
            // 根据当前页面配置导航栏的显示状态
            .navigationBarHidden(itemType.isNavigationBarHidden(selection: selection))
            .navigationBarTitle(itemType.title, displayMode: .inline)
            .navigationBarItems(trailing: itemType.navigationBarTrailingItems(selection: selection))
        }
    }
    
    // ItemType: 标签页类型枚举
    // 定义了四个主要模块的类型，并提供相关配置
    enum ItemType: Int {
        case chat     // 聊天
        case contact  // 通讯录
        case discover // 发现
        case me       // 我
        
        // 返回对应的标签图标
        var image: Image {
            switch self {
            case .chat:     return Image("root_tab_chat")
            case .contact:  return Image("root_tab_contact")
            case .discover: return Image("root_tab_discover")
            case .me:       return Image("root_tab_me")
            }
        }
        
        var selectedImage: Image {
            switch self {
            case .chat:     return Image("root_tab_chat_selected")
            case .contact:  return Image("root_tab_contact_selected")
            case .discover: return Image("root_tab_discover_selected")
            case .me:       return Image("root_tab_me_selected")
            }
        }
        
        var title: String {
            switch self {
            case .chat:     return "微信"
            case .contact:  return "通讯录"
            case .discover: return "发现"
            case .me:       return "我"
            }
        }
        
        func isNavigationBarHidden(selection: Int) -> Bool {
            selection == ItemType.me.rawValue
        }
        
        func navigationBarTrailingItems(selection: Int) -> AnyView {
            switch ItemType(rawValue: selection)! {
            case .chat:
                return AnyView(Image(systemName: "plus.circle"))
            case .contact:
                return AnyView(Image(systemName: "person.badge.plus"))
            case .discover:
                return AnyView(EmptyView())
            case .me:
                return AnyView(EmptyView())
            }
        }
    }
    
    struct Item: View {
        let type: ItemType
        let selection: Int
        
        var body: some View {
            VStack {
                if type.rawValue == selection {
                    type.selectedImage
                } else {
                    type.image
                }
                
                Text(type.title)
            }
        }
    }
    
    private var itemType: ItemType { ItemType(rawValue: selection)! }
}

struct RootTabView_Previews : PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
