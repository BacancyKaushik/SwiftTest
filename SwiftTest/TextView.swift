//
//  TextView.swift
//  SwiftTest
//
//  Created by Kaushik on 17/03/24.
//

import SwiftUI

struct TextView: View
{
    @State  var firstTXF: String = ""
    @State  var secondTXT: String = ""

    @State  var textColor: Color = .black
    
    @State  var fontFirstTXF: Font = .custom("NotoSans-Bold", size: 20)// NotoSansCondensed-Regular, NotoSansCondensed-Medium
    @State  var fontSecondTXF: Font = .custom("FONTSPRINGDEMO-ProximaNovaExCnMediumRegular", size: 20)// FONTSPRINGDEMO-ProximaNovaExCnRegular, FONTSPRINGDEMO-ProximaNovaBold


    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Text("TextView 1")
                setTextview(text: $firstTXF, font: $fontFirstTXF)
               
                Text("TextView 2")
                setTextview(text: $secondTXT, font: $fontSecondTXF)
            
            }
        }        
    }
    
    struct setTextview: View
    {
        @Binding var text: String
        @Binding var font: Font
       
        
        var body: some View
        {
            HStack
            {
                
                TextEditor(text: $text)
                    .foregroundColor(.black)
                                    .font(font)
                                    .cornerRadius(10)
                                    .shadow(radius: 20)
                                    .padding()
            }
        }
    }
    
    // Get font family name
   /* init()
    {
        for family in UIFont.familyNames.sorted() {
            print("Family: \(family)")
            
            // 2
            let names = UIFont.fontNames(forFamilyName: family)
            for fontName in names {
                print("- \(fontName)")
            }
        }
    }*/
}

#Preview 
{
    TextView()
}
