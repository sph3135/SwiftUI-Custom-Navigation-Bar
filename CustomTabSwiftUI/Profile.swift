//
//  Profile.swift
//  CustomTabSwiftUI
//
//  Created by Sudeep P H on 27/09/23.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            Text("Profile")
                .font(Font.custom("HelveticaNeue-Thin", size: 24))
                .foregroundColor(Color.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundGradient)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
