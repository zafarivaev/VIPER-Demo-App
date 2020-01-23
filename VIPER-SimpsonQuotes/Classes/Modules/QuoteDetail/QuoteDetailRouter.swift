//
//  QuoteDetailRouter.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation
import UIKit

class QuoteDetailRouter: PresenterToRouterQuoteDetailProtocol {
    
    // MARK: Static methods
    static func createModule(with quote: Quote) -> UIViewController {
        print("QuoteDetailRouter creates the QuoteDetail module.")
        let viewController = QuoteDetailViewController()
        
        let presenter: ViewToPresenterQuoteDetailProtocol & InteractorToPresenterQuoteDetailProtocol = QuoteDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = QuoteDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = QuoteDetailInteractor()
        viewController.presenter?.interactor?.quote = quote
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
