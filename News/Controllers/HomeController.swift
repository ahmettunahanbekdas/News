//
//  ViewController.swift
//  News
//
//  Created by Ahmet Tunahan Bekdaş on 18.01.2024.
//

import UIKit
// https://newsapi.org/v2/top-headlines?country=us&apiKey=dcbf3c143b0c47a8aa7046bb1fd0683e

class HomeController: UIViewController {
    
    
    //MARK: - Properties
    private var tableView: UITableView {
        let tableView = UITableView()
        tableView.separatorStyle = .none //Cell ler arasında ki çizgileri siler
        return tableView
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Helpers
    private func configure() {
        view.backgroundColor = .white
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Actions
}



//MARK: -UITableViewDataSource (Görünümde ki verileri yüklediğimiz kısımdır)
extension HomeController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension HomeController: UITableViewDelegate  {
    
}





