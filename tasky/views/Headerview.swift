//
//  Headerview.swift
//  Tickr
//
//  Created by Aryan Kadam on 27/08/25.
//

import SwiftUI

struct Headerview: View {
    let  title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .offset(y:-70)
            VStack{
                Text(title)
                    .font(.system(size: 50, weight: .bold, design: .default))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(Color.white)
            }
            .padding(.bottom,150)
        }
        .frame(width: UIScreen.main.bounds.width * 3 , height: 350)
        .offset(y : -70)
    }
}

#Preview {
    Headerview(title:"Title", subtitle: "Subtitle", angle: 15, backgroundColor: Color(red: 1.0, green: 0.2, blue: 0.4) )
}
