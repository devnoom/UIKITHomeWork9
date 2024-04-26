//
//  HomeController.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 24.04.24.
//

import UIKit

class HomeController: UIViewController {
   
    var onCountryUpdated: (()-> Void)?
    
    
    // MARK: - Variables
    private var countries: [Country] = []
    private var viewModel = ViewCountryViewModel()
     var filtredCountry: [Country] = []
    
    //MARK: - UI Components
    private let searchController = UISearchController(searchResultsController: nil)
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
        self.onCountryUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }}
        viewModel.delegate = self
        viewModel.viewDidLoad()
        setupSearchController()
        
        
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
    private func setupSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search country"
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    //MARK: - Selectors
    
    

    
}
//MARK: - Tableview extensions
extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as! CountryCell
        let country = countries[indexPath.row]
        cell.CountryName.text = country.name?.common
        cell.configure(with: country)
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    
}
// MARK: - ViewCountryViewModelDelegate
extension HomeController: ViewCountryViewModelDelegate {
    func countriesFetched(_ countries: [Country]) {
        self.countries = countries
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func navigateToDetailsVC(country: Country) {
        let detailsVC = DetailsController(country: country)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension HomeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(index: indexPath)

    }
}

extension HomeController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("asd")
    }
}
