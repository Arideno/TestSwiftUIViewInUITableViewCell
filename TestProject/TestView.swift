//
//  TestView.swift
//  TestProject
//
//  Created by Andrii Moisol on 22.06.2022.
//

import SwiftUI

struct TestView: View {
    var text: String
    var action: () -> Void

    var body: some View {
        VStack {
            Spacer()
            
            Button(action: action, label: {
                Text(text)
            })
            .frame(width: 50, height: 50, alignment: .center)
            .background(Color.white)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: CGFloat(Int(text)!))
        .background(Color.red)
    }
}
