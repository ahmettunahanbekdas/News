//
//  ViewController.swift
//  News
//
//  Created by Ahmet Tunahan Bekdaş on 18.01.2024.
//

import UIKit

class HomeController: UIViewController {
    
    
//MARK: - Properties
    private let identifier = "HomeCell"
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none //Cell ler arasında ki çizgileri siler
        return tableView
    }()
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Run App!")
        configure()
    }
    
//MARK: - Helpers
    private func configure() {
        view.backgroundColor = .green
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
//MARK: - Actions
}

//MARK: - UITableViewDelegate
extension HomeController: UITableViewDelegate  {
    
}

//MARK: -UITableViewDataSource (Görünümde ki verileri yüklediğimiz kısımdır)
extension HomeController:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "News"
        return cell
    }
}







