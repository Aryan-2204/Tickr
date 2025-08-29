//
//  TLview.swift
//  Tickr
//
//  Created by Aryan Kadam on 27/08/25.
//

import SwiftUI

struct TLview: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    var body: some View {
        Button{
            action()
            // Action
        } label:{
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 300, height: 50)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
                
                
            }
        }
        .padding()
    }
}

#Preview {
    TLview(title: "value", backgroundColor: .pink , action: {
       //Action
    })
}
