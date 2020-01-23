//
//  QuotesRouter.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

class QuotesRouter: PresenterToRouterQuotesProtocol {
    
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        print("QuotesRouter creates the Quotes module.")
        let viewController = QuotesViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterQuotesProtocol & InteractorToPresenterQuotesProtocol = QuotesPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = QuotesRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = QuotesInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    // MARK: - Navigation
    func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: Quote) {
        print("QuotesRouter is instructed to push QuoteDetailViewController onto the navigation stack.")
        let quoteDetailViewController = QuoteDetailRouter.createModule(with: quote)
            
        let viewController = view as! QuotesViewController
        viewController.navigationController?
            .pushViewController(quoteDetailViewController, animated: true)
        
    }
    
}
