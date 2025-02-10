//
//  ContactRow.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

// ContactRow: 通讯录列表行组件
// 负责展示通讯录中的单个联系人或系统功能项，包括：
// 1. 支持系统功能项（如"新的朋友
struct ContactRow: View {
    
    let icon: String
    let title: String
    let style: Style
    
    var body: some View {
        HStack(spacing: 12) {
            Image(icon)
                .renderingMode(.original)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(style == .system ? 4 : 6)

            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.primary)
        }
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
    }
    
    enum Style {
        case system
        case member
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(icon: "contact_new_friend", title: "新的朋友", style: .system)
    }
}
