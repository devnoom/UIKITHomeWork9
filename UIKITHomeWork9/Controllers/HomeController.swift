//
//  HomeController.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 24.04.24.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Variables
    private let country: [countries] = countries.getArray()
    
    
    //MARK: - UI Components
    private let tableView: UITableView = {
        let TV = UITableView()
        TV.backgroundColor = .systemBackground
        TV.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        return TV
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        

    }
    
    
    //MARK: - UI Setup
    private func setupUI() {
        navigationItem.title = "Countries"
        self.view.backgroundColor = .blue
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
    //MARK: - Selectors
    
    

    
}
//MARK: - Tableview Functions
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as? CountryCell else {
            fatalError("Unable to dequeue CountryCell in HomeController")
        }
        let country = self.country[indexPath.row]
        cell.configure(with: country)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let country = self.country[indexPath.row]
        let vc = DetailsController(country)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
