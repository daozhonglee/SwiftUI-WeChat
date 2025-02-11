//
//  StatusBarStyleEnvironment.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/3/8.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// 扩展 EnvironmentValues 以支持状态栏样式的环境变量
// 这样可以在 SwiftUI 视图层级中传递和访问状态栏样式
extension EnvironmentValues {
    
    // 通过环境值访问状态栏样式
    // 使用自定义的 StatusBarStyle.Key 作为键来存储和获取状态栏样式
    var statusBarStyle: StatusBarStyle { self[StatusBarStyle.Key.self] }
}

// StatusBarStyle 类用于管理状态栏样式
// 提供了获取和设置状态栏样式的功能
class StatusBarStyle {
    
    // 获取状态栏样式的闭包
    // 默认返回 .default 样式
    var getter: () -> UIStatusBarStyle = { .default }
    
    // 设置状态栏样式的闭包
    // 默认为空操作
    var setter: (UIStatusBarStyle) -> Void = { _ in }

    // 当前状态栏样式的计算属性
    // 通过 getter 和 setter 闭包实现对状态栏样式的读写操作
    var current: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

// 扩展 StatusBarStyle 以实现 EnvironmentKey 协议
// 使其可以作为 SwiftUI 环境变量使用
extension StatusBarStyle {
    
    // 定义环境键，用于在环境中存储状态栏样式
    struct Key: EnvironmentKey {
        // 设置默认值为一个新的 StatusBarStyle 实例
        static let defaultValue: StatusBarStyle = StatusBarStyle()
    }
}

