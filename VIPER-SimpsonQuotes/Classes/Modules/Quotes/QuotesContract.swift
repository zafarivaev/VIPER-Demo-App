//
//  QuotesContract.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewQuotesProtocol: class {
    func onFetchQuotesSuccess()
    func onFetchQuotesFailure(error: String)
    
    func showHUD()
    func hideHUD()
    
    func deselectRowAt(row: Int)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterQuotesProtocol: class {
    
    var view: PresenterToViewQuotesProtocol? { get set }
    var interactor: PresenterToInteractorQuotesProtocol? { get set }
    var router: PresenterToRouterQuotesProtocol? { get set }
    
    var quotesStrings: [String]? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorQuotesProtocol: class {
    
    var presenter: InteractorToPresenterQuotesProtocol? { get set }
    
    func loadQuotes()
    func retrieveQuote(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterQuotesProtocol: class {
    
    func fetchQuotesSuccess(quotes: [APIQuote])
    func fetchQuotesFailure(errorCode: Int)
    
    func getQuoteSuccess(_ quote: APIQuote)
    func getQuoteFailure()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterQuotesProtocol: class {
    
    static func createModule() -> UINavigationController
    
    func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: APIQuote)
}
