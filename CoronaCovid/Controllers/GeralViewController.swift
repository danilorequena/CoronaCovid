//
//  GeralViewController.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import UIKit

class GeralViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var push: UIRefreshControl?
    var viewModel: ListViewModel?
    var infos: [CovidAllCountrys] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
    }
    
//    override init(viewModel: ViewModelType?) {
//        self.viewModel = viewModel as? ListViewModel
//        super.init(viewModel: viewModel)
//        self.viewModel?.viewDisplay = self
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getAllData()
    }
    
    func loadInfo() {
        RequestAllCountries.loadAll { (country) in
            if let country = country {
                DispatchQueue.main.async {
//                    self.infos += country.
                }
            }
        } onError: { (Error) in
            print(Error)
        }

    }
    
    func setupTableView() {
        self.tableView.register(InfoCountryTableViewCell.loadNib(), forCellReuseIdentifier: InfoCountryTableViewCell.identifier())
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.contentInset = UIEdgeInsets(top: 408, left: 0, bottom: 0, right: 0)
        self.tableView.backgroundColor = .clear
//        self.viewHeaderOpacity.alpha = 0.0  -> Pensar em colocar ou não
        self.push = UIRefreshControl()
        push?.addTarget(self, action: #selector(getAllData), for: .valueChanged)
        self.tableView.addSubview(push!)
    }
    
    @objc func getAllData() {
        self.viewModel?.getAllData()
    }
    
    func refreshView() {
        self.push?.endRefreshing()
        self.tableView.reloadData()
    }

}

extension GeralViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.items.count ?? 0

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoCountryTableViewCell.identifier()) as! InfoCountryTableViewCell
        guard let country = self.viewModel?.items[indexPath.row] else { return cell }
        cell.setupData(country: country)
        return cell
            
    }


}
