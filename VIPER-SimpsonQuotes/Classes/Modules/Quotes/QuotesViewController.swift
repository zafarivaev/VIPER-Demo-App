//
//  QuotesViewController.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit
import PKHUD

class QuotesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter?.fetchQuotes()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterQuotesProtocol?
    var quotes: [String] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
}

extension QuotesViewController: PresenterToViewQuotesProtocol{
    
    func onFetchQuotesSuccess(quotes: [String]) {
        print("View receives the response from presenter and updates itself.")
        self.quotes = quotes
        self.tableView.reloadData()
    }
    
    func onFetchQuotesFailure(error: String) {
        print("View receives the response from presenter and prints error: \(error)")
    }
    
    func showHUD() {
        HUD.show(.progress, onView: self.view)
    }
    
    func hideHUD() {
        HUD.hide()
    }
    
    func deselectRowAt(row: Int) {
        self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
    }
}

// MARK: - UITableView Delegate & Data Source
extension QuotesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = quotes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectQuoteAt(index: indexPath.row)
        presenter?.deselectQuoteAt(index: indexPath.row)
    }
}

// MARK: - UI Setup
extension QuotesViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true

    }
}
