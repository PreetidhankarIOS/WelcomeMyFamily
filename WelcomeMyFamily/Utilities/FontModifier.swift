//
//  FontModifier.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import SwiftUI

enum SailecFontType : String {
   case bold = "Sailec-Bold"
    case medium = "ailec-Medium"
    case regular = "Sailec"
    
}

struct SailecFont: ViewModifier{
    var type: SailecFontType
    var size: CGFloat
    
    init(_ type: SailecFontType = .regular, size: CGFloat = 16) {
        self.type = type
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content.font(Font.custom(type.rawValue, size: size))
    }
}
