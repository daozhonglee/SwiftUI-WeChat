//
//  WeChatApp.swift
//  WeChat
//
//  Created by Gesen on 2020/9/26.
//  Copyright © 2020 Gesen. All rights reserved.
//

// 导入 SwiftUI 框架，这是构建用户界面的主要框架
import SwiftUI

// @main 标记表示这是应用程序的入口点
// 定义主应用结构体，遵循 App 协议，这是 SwiftUI 应用程序的根级别结构
@main 
struct WeChatApp: App {
    // 实现 App 协议要求的 body 属性
    // Scene 代表应用程序窗口的容器
    var body: some Scene {
        // WindowGroup 是一个场景容器，用于展示应用程序的主要内容
        WindowGroup {
            // 创建根视图 RootView 作为应用的主界面
            RootView()
                // 当视图出现时设置应用程序的外观
                .onAppear(perform: setupAppearance)
                // 当视图出现时设置状态栏样式
                .onAppear(perform: setupStatusBarStyle)
        }
    }
    
    // 设置应用程序的整体外观样式
    func setupAppearance() {
        // 创建返回按钮图标，并添加内边距调整其位置
        let backImage = UIImage(named: "back")?
                .withPadding(.init(top: -2, left: 0, bottom: 0, right: -4))
        
        // 配置导航栏的全局样式
        // 设置返回按钮的图标
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        // 移除导航栏底部阴影
        UINavigationBar.appearance().shadowImage = UIImage()
        // 设置导航栏按钮和文字颜色
        UINavigationBar.appearance().tintColor = UIColor(named: "navigation_tint")
        // 设置导航栏背景色
        UINavigationBar.appearance().barTintColor = UIColor(named: "navigation_bar_tint")
        
        // iOS 15.0 及以上版本的特殊处理
        if #available(iOS 15.0, *) {
            // 创建新的导航栏外观配置
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            // 设置滚动边缘的导航栏外观，解决 iOS15 导航栏透明问题
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            // 创建新的标签栏外观配置
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            // 设置滚动边缘的标签栏外观，解决 iOS15 标签栏透明问题
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            
            // 移除 iOS15 新增的列表头部默认间距
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }
    
    // 设置状态栏样式的处理方法
    func setupStatusBarStyle() {
        // 获取当前的主窗口和状态栏管理器
        guard
            // 过滤获取当前激活的主窗口
            let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first,
            // 获取窗口场景的状态栏管理器
            let statusBarManager = window.windowScene?.statusBarManager
            else { return }
        
        // 设置状态栏样式的获取器
        // 用于获取当前状态栏的样式
        StatusBarStyle.Key.defaultValue.getter = {
            statusBarManager.statusBarStyle
        }
        // 设置状态栏样式的设置器
        // 用于动态更改状态栏样式
        StatusBarStyle.Key.defaultValue.setter = {
            /// 暂时使用直接设置的方式，未来可能会有更好的解决方案
            UIApplication.shared.statusBarStyle = $0
        }
    }
}
