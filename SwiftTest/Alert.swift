//
//  Alert.swift
//  SwiftTest
//
//  Created by Kaushik on 17/03/24.
//

import SwiftUI

struct Alert: View
{
    @State var isActive: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Button {
                    isActive = true
                } label: {
                    Text("Show Dailog")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color.black.cornerRadius(10).shadow(radius: 10))
                }
                .padding()
            }
            .padding()

            if isActive {
                CustomDialog(isActive: $isActive, title: "Dialog", message: "This is the content of the Dialog. Just a demonstration of how the Dialog works.", buttonTitle: "Got it") {
                    print("Pass to viewModel")
                    isActive = false
                }
            }
        }
    }
}

#Preview {
    Alert()
}
