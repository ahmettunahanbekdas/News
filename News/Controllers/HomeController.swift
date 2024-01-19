//
//  ViewController.swift
//  News
//
//  Created by Ahmet Tunahan Bekdaş on 18.01.2024.
//

import UIKit
import SDWebImage

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    private let identifier = "HomeCell"
    
    private var viewModel : NewsListViewModel!

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        return indicator
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        configureTableView()
        configureIndicator()
        getData()
    }
    
    //MARK: - Helpers
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(HomeCell.self, forCellReuseIdentifier: identifier)
    }
    
    private func configureIndicator() {
        view.addSubview(indicator)
        indicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    
    
    //MARK: - Get API
    func getData(){
        NewsManager().fetchNewData { articles in
            if let articles = articles {
                self.viewModel = NewsListViewModel(newsList: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.indicator.stopAnimating()
                }
            }
        }
    }
}

//MARK: - UITableViewDelegate (Satıra tıklama işlemi)
extension HomeController: UITableViewDelegate  {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewModel = self.viewModel.newsAtIndex(indexPath.row)
        
        if let url = URL(string: viewModel.url) {
            let webViewController = WebViewController()
            webViewController.url = url
            
            navigationController?.pushViewController(webViewController, animated: true)
        }
    }
    
}

//MARK: -UITableViewDataSource (Görünümde ki verileri yüklediğimiz kısımdır)
extension HomeController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {return UITableViewCell()}
        let viewModel = self.viewModel.newsAtIndex(indexPath.row)
        cell.titleLabel.text = viewModel.title
        cell.newsImage.sd_setImage(with: URL(string: viewModel.urlToImage))
        return cell
    }
}








