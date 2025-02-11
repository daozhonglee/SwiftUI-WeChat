//
//  Member.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/11/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

// 导入基础框架，提供基本的数据类型和功能
import Foundation

// Member 结构体：表示一个用户成员信息
// Codable：支持编码和解码，用于数据持久化和网络传输
// Equatable：支持相等性比较
// Identifiable：提供唯一标识符，用于 SwiftUI 列表渲染
struct Member: Codable, Equatable, Identifiable {
    // 成员的唯一标识符，使用 UUID 自动生成
    var id = UUID()
    // 成员朋友圈背景图片名称，可选类型
    let background: String?
    // 成员头像图片名称
    let icon: String
    // 成员唯一标识字符串，可选类型
    let identifier: String?
    // 成员昵称
    let name: String
}

// Member 的扩展，提供示例成员数据
extension Member {
    // 预定义的 SwiftUI 官方账号成员
    static let swiftui = Member(
        background: nil,
        icon: "data_avatar1",
        identifier: nil,
        name: "SwiftUI"
    )
    
    static let goddess = Member(
        background: nil,
        icon: "data_avatar2",
        identifier: nil,
        name: "女神"
    )
    
    static let pm = Member(
        background: nil,
        icon: "data_avatar3",
        identifier: nil,
        name: "产品经理"
    )
    
    static let landlord = Member(
        background: nil,
        icon: "data_avatar4",
        identifier: nil,
        name: "房东"
    )
    
    static let wang = Member(
        background: nil,
        icon: "data_avatar5",
        identifier: nil,
        name: "王同学"
    )
    
    static let princess = Member(
        background: nil,
        icon: "data_avatar6",
        identifier: nil,
        name: "公主"
    )
    
    static let foodie = Member(
        background: nil,
        icon: "data_avatar7",
        identifier: nil,
        name: "吃货"
    )
    
    static let nameless = Member(
        background: nil,
        icon: "data_avatar8",
        identifier: nil,
        name: "无名"
    )
    
    static let chives = Member(
        background: nil,
        icon: "data_avatar9",
        identifier: nil,
        name: "中国好韭菜"
    )
    
    static let me = Member(
        background: "data_moment_background",
        icon: "data_avatar10",
        identifier: "sen_baby",
        name: "森仔"
    )
}
