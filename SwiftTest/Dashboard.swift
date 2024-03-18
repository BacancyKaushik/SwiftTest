//
//  Dashboard.swift
//  SwiftTest
//
//  Created by Kaushik on 18/03/24.
//

import SwiftUI

struct Dashboard: View 
{
    @State private var textViewButton: String = "TextView"
    @State private var textFieldButton: String = "TextField"
    @State private var alertButton: String = "Alert"
    
    var body: some View
    {
        NavigationStack
        {
            VStack
            {
                //Show TextField Button
                NavigationLink
                {
                    TextView()
                } label: {
                    SetcustomButton(title: $textViewButton)
                }
                
                //Show TextField Button
                NavigationLink
                {
                    TextFieldView()
                } label: {
                    SetcustomButton(title: $textFieldButton)
                }
                
                //Show Alert Button
                NavigationLink
                {
                    Alert()
                } label: {
                    SetcustomButton(title: $alertButton)
                }
            }
        }
        .navigationBarTitle("Welcome..!!")
        .navigationBarTitleDisplayMode(.automatic)
    }
    
    struct SetcustomButton: View
    {
        @Binding var title: String
       
        
        var body: some View
        {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 20)
                .background(Color.black.cornerRadius(10).shadow(radius: 10))
                .padding()
        }
    }
}

#Preview 
{
    NavigationView 
    {
        Dashboard()
    }
}
