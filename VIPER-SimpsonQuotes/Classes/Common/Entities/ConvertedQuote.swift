//
//  ConvertedQuote.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/3/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

struct ConvertedQuote {
    
    var quote: String?
    var character: String?
    var image: UIImage?
    var characterDirection: String?
    
    init(quote: String,
         character: String,
         image: UIImage?,
         characterDirection: String) {
        
        self.quote = quote
        self.character = character
        self.image = image
        self.characterDirection = characterDirection
    }
    
}
