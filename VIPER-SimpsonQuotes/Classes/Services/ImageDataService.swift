//
//  ImageDataService.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/3/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

class ImageDataService {
    
    static let shared = { ImageDataService() }()
    
    func convertToUIImage(from data: Data) -> UIImage {
        return UIImage(data: data)!
    }
}
