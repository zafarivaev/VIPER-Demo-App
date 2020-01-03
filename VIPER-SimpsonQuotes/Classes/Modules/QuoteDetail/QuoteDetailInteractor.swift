//
//  QuoteDetailInteractor.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

class QuoteDetailInteractor: PresenterToInteractorQuoteDetailProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterQuoteDetailProtocol?
    var quote: APIQuote?
    
    func getImageFromURL() {
        print("Interactor receives the request from Presenter to get image data from the server.")
        KingfisherService.shared.loadImageFrom(urlString: quote!.image!, success: { (data) in
            self.presenter?.getImageFromURLSuccess(quote: self.quote!, data: data)
        }) { (error) in
            self.presenter?.getImageFromURLFailure(quote: self.quote!)
        }

    }
    
    
}
