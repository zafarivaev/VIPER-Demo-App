//
//  QuoteDetailPresenter.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

class QuoteDetailPresenter: ViewToPresenterQuoteDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewQuoteDetailProtocol?
    var interactor: PresenterToInteractorQuoteDetailProtocol?
    var router: PresenterToRouterQuoteDetailProtocol?
    
    func viewDidLoad() {
        print("Presenter is instructed to get image from url.")
        interactor?.getImageDataFromURL()
    }
    
}

extension QuoteDetailPresenter: InteractorToPresenterQuoteDetailProtocol {
    
    func getImageFromURLSuccess(quote: APIQuote, data: Data?) {
        print("Presenter receives the result from Interactor after it's done its job.")
        let convertedQuote = ConvertedQuote(quote: quote.quote!, character: quote.character!, image: ImageDataService.shared.convertToUIImage(from: data!), characterDirection: quote.characterDirection!)

        view?.onGetImageFromURLSuccess(convertedQuote.quote!, character: convertedQuote.character!, image: convertedQuote.image!)
    }
    
    func getImageFromURLFailure(quote: APIQuote) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.onGetImageFromURLFailure(quote.quote!, character: quote.character!)
    }
    
}
