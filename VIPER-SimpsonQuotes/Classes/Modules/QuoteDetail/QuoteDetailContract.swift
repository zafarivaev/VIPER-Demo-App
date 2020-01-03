//
//  QuoteDetailContract.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewQuoteDetailProtocol: class {
    
    func onGetImageFromURLSuccess(_ quote: String, character: String, image: UIImage)
    func onGetImageFromURLFailure(_ quote: String, character: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterQuoteDetailProtocol: class {
    
    var view: PresenterToViewQuoteDetailProtocol? { get set }
    var interactor: PresenterToInteractorQuoteDetailProtocol? { get set }
    var router: PresenterToRouterQuoteDetailProtocol? { get set }

    func viewDidLoad()
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorQuoteDetailProtocol: class {
    
    var presenter: InteractorToPresenterQuoteDetailProtocol? { get set }
    
    var quote: APIQuote? { get set }
    
    func getImageDataFromURL()
    
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterQuoteDetailProtocol: class {
    
    func getImageFromURLSuccess(quote: APIQuote, data: Data?)
    func getImageFromURLFailure(quote: APIQuote)
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterQuoteDetailProtocol: class {
    
    static func createModule(with quote: APIQuote) -> UIViewController
}
