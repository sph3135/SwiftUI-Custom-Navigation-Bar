//
//  ContentView.swift
//  CustomTabSwiftUI
//
//  Created by Sudeep P H on 27/09/23.
//

import SwiftUI

enum TabItems: Int, CaseIterable {
    case users = 0
    case favorite
    case chat
    case profile
    
    var title: String {
        switch self {
        case .users:
            return "Users"
        case .favorite:
            return "Favorite"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String {
        switch self {
        case .users:
            return "user-icon"
        case .favorite:
            return "fav-icon"
        case .chat:
            return "chat-icon"
        case .profile:
            return "profile-icon"
        }
    }
    
}

struct ContentView: View {
    
    @State var selectedTab = 0
    @State var primaryColor = Color(.sRGB, red:139 / 255, green: 10 / 255, blue: 130 / 255)
    @State var secondaryColor = Color(.sRGB, red:83 / 255, green: 120 / 255, blue: 149 / 255)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Users()
                    .tag(0)
                Favorites()
                    .tag(1)
                Chat()
                    .tag(2)
                Profile()
                    .tag(3)
            }
            
            ZStack{
                HStack{
                    ForEach((TabItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 70)
            .background(.clear)
            .cornerRadius(15)
            .padding(.horizontal, 26)
        }
    }
}


extension ContentView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .white : primaryColor)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .white : primaryColor)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? primaryColor.opacity(0.6) : .clear)
        .cornerRadius(25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
