//
//  QuotesPresenter.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

class QuotesPresenter: ViewToPresenterQuotesProtocol {
    
    // MARK: Properties
    var view: PresenterToViewQuotesProtocol?
    var interactor: PresenterToInteractorQuotesProtocol?
    var router: PresenterToRouterQuotesProtocol?
    
    // MARK: Inputs from view
    func fetchQuotes() {
        print("Presenter is instructed to get quotes")
        view?.showHUD()
        interactor?.loadQuotes()
    }
    
    func didSelectQuoteAt(index: Int) {
        interactor?.getQuote(at: index)
    }
    
    func deselectQuoteAt(index: Int) {
        view?.deselectRowAt(row: index)
    }
    
}

// MARK: - Outputs to view
extension QuotesPresenter: InteractorToPresenterQuotesProtocol {
    
    func fetchQuotesSuccess(quotes: [APIQuote]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.hideHUD()
        view?.onFetchQuotesSuccess(quotes: quotes.compactMap { $0.quote })
    }
    
    func fetchQuotesFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.hideHUD()
        view?.onFetchQuotesFailure(error: "Couldn't fetch quotes: \(errorCode)")
    }
    
    func getQuoteSuccess(_ quote: APIQuote) {
        router?.pushToQuoteDetail(on: view!, with: quote)
    }
    
    func getQuoteFailure() {
        view?.hideHUD()
        print("Couldn't retrieve quote by index")
    }
    
    
}
