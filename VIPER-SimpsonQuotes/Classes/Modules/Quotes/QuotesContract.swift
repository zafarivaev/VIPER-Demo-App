//
//  QuotesContract.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewQuotesProtocol {
    func onFetchQuotesSuccess(quotes: [String])
    func onFetchQuotesFailure(error: String)
    
    func showHUD()
    func hideHUD()
    
    func deselectRowAt(row: Int)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterQuotesProtocol {
    
    var view: PresenterToViewQuotesProtocol? { get set }
    var interactor: PresenterToInteractorQuotesProtocol? { get set }
    var router: PresenterToRouterQuotesProtocol? { get set }
    
    func fetchQuotes()
    
    func didSelectQuoteAt(index: Int)
    func deselectQuoteAt(index: Int)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorQuotesProtocol {
    
    var presenter: InteractorToPresenterQuotesProtocol? { get set }
    
    func loadQuotes()
    func getQuote(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterQuotesProtocol {
    
    func fetchQuotesSuccess(quotes: [APIQuote])
    func fetchQuotesFailure(errorCode: Int)
    
    func getQuoteSuccess(_ quote: APIQuote)
    func getQuoteFailure()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterQuotesProtocol {
    
    func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: APIQuote)
}
