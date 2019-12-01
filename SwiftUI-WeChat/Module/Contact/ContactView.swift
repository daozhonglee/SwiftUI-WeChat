//
//  ContactView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ContactView : View {
    let contacts: [Contact] = mock(name: "contacts")
    
    var body: some View {
        List {
            Group {
                SearchEntryView()
                ForEach(contacts) { contact in
                    Section(header: SectionHeader(title: contact.id)) {
                        ForEach(contact.members) { member in
                            MemberCell(
                                member: member,
                                isLast: member.id == contact.members.last?.id
                            )
                        }
                    }
                }
            }
            .listRowInsets(EdgeInsets())
        }
        .navigationBarTitle(Text("联系人"), displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "person.badge.plus"))
    }
}

#if DEBUG
struct ContactView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactView()
        }
    }
}
#endif

private struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.secondary)
            .padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 18))
    }
}

private struct MemberCell: View {
    let member: Member
    let isLast: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 14) {
                Image(member.icon)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(8)

                Text(member.name)
                    .font(.system(size: 18))
                    .foregroundColor(.primary)
            }
            .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
            
            if !isLast {
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 76, bottom: 0, trailing: 0))
            }
            
            NavigationLink(destination: ProfileView()) {
                EmptyView()
            }
            .frame(width: 0, height: 0)
            .opacity(0)
        }
        .background(Color("cell"))
    }
}
