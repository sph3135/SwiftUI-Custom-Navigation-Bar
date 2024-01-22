//
//  Chat.swift
//  CustomTabSwiftUI
//
//  Created by Sudeep P H on 27/09/23.
//

import SwiftUI

struct Chat: View {
    var body: some View {
        VStack {
            Text("Chats")
                .font(Font.custom("HelveticaNeue-Thin", size: 24))
                .foregroundColor(Color.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundGradient)
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
