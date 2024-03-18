//
//  ContentView.swift
//  SwiftTest
//
//  Created by Kaushik on 15/03/24.
//

import SwiftUI

struct TextFieldView: View
{
    @State private var simpleText: String = ""
    @State private var searchText: String = ""
    @State private var passwordText: String = ""
    @State private var lockArrowText: String = ""


    

    @FocusState private var focusedTextField: Int?

    var body: some View
    {
        VStack 
        {
            // Simple TextField
            customTextField(placeholder: "Enter text here", text: $simpleText, tag: 0)

            // Search TextField
            searchTextField(placeholder: "Search here", text: $searchText, tag: 1)
                        
            //Lock and Arrow TextField
            lockArrowTextField(placeholder: "Enter text here", text: $lockArrowText, tag: 3)
            
            //Password TextField
            passwordTextField(placeholder: "Enter Password", text: $passwordText, isSecure: true, tag: 2)
                    
        }
        .padding()
    }
        
    //Custom TextField
    struct customTextField: View
    {
        var placeholder: String
        @Binding var text: String
        var tag: Int
        @FocusState private var focusedTextField: Int?
        
        var body: some View 
        {
            TextField(placeholder, text: $text)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                .strokeBorder(isFocused ? Color.black : Color.gray.opacity(3), lineWidth: 1)
            )
            .focused($focusedTextField, equals: tag)
        }
        
        private var isFocused: Bool {
            focusedTextField == tag
        }
    }
    
    //Search TextField
    struct searchTextField: View
    {
        var placeholder: String
        @Binding var text: String
        
        var tag: Int
        @FocusState private var focusedTextField: Int?
        
        var body: some View
        {
            TextField(placeholder, text: $text)
            .padding(.leading, 20)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                .strokeBorder(isFocused ? Color.black : Color.gray.opacity(3), lineWidth: 1)
            )
            .focused($focusedTextField, equals: tag)
            .overlay(
                Image(systemName: "magnifyingglass")
                    .foregroundColor(isFocused ? Color.black : Color.gray.opacity(3))
                    .padding(.leading, 0)
                    .offset(x: 10, y: 0), alignment: .leading
            )
        }
        
        private var isFocused: Bool {
            focusedTextField == tag
        }
    }
    
    //Password TextField
    struct passwordTextField: View
    {
        var placeholder: String
        @Binding var text: String
        @State var isSecure: Bool = true

        var tag: Int
        @FocusState private var focusedTextField: Int?
        
        var body: some View
        {
            Group{
                if isSecure
                {
                    SecureField(placeholder, text: $text)
                    
                }else{
                    TextField(placeholder, text: $text)
                }
            }
            .padding(.trailing, 20)
            .padding()
            .background(RoundedRectangle(cornerRadius: 25)
            .strokeBorder(isFocused ? Color.black : Color.gray.opacity(3), lineWidth: 1)
            .animation(.easeInOut(duration: 0.2), value: isSecure)
            )
            .focused($focusedTextField, equals: tag)
            
            .overlay(
                Button(action: { isSecure.toggle() })
                {
                    Image(systemName: !isSecure ? "eye" : "eye.slash" )
                        .foregroundColor(isFocused ? Color.black : Color.gray.opacity(3))
                }
                    .padding(.trailing, 10)
                    .offset(x: 0, y: 0),
                    alignment: .trailing
            )
        }
        
        private var isFocused: Bool {
            focusedTextField == tag
        }
    }
    
    //Lock and Arrow TextField
    struct lockArrowTextField: View
    {
        var placeholder: String
        @Binding var text: String
        
        var tag: Int
        @FocusState private var focusedTextField: Int?
        
        var body: some View
        {
            TextField(placeholder, text: $text)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                .strokeBorder(isFocused ? Color.black : Color.gray.opacity(3), lineWidth: 1)
            )
            .focused($focusedTextField, equals: tag)
            .overlay(
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(isFocused ? Color.black : Color.gray.opacity(3))
                        //.padding(.leading, 0)
                    
                    Spacer()
                    Image(systemName: "arrow.forward")
                    .foregroundColor(isFocused ? Color.black : Color.gray.opacity(3))
                    .padding(.trailing, 10)
                }
                .padding(.horizontal, 8),
                alignment: .leading
            )
            
        }
        
        private var isFocused: Bool {
            focusedTextField == tag
        }
    }
    

}

#Preview {
    TextFieldView()
}
