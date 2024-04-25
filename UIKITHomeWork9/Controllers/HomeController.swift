//
//  HomeController.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 24.04.24.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Variables
    private let country: [Countries] = [
        Countries(
            name: Name(common: "CountryName", official: "OfficialCountryName"),
            altSpellings: ["Alt1", "Alt2"],
            region: "Region",
            subregion: "Subregion",
            independent: true,
            status: "Status",
            capital: ["Capital1", "Capital2"],
            maps: Map(googleMaps: "GoogleMapsURL", openStreetMaps: "OpenStreetMapsURL"),
            flags: Flags(png: "FlagPNGURL", svg: "FlagSVGURL", alt: "FlagAlt"),
            capitalInfo: CapitalInfo(latlng: [0.0, 0.0]), // Fixed typo and used correct struct name
            postalCode: PostalCode(format: "Format", regex: "Regex") // Fixed typo and used correct struct name
        ),
        Countries(
            name: Name(common: "CountryName", official: "OfficialCountryName"),
            altSpellings: ["Alt1", "Alt2"],
            region: "Region",
            subregion: "Subregion",
            independent: true,
            status: "Status",
            capital: ["Capital1", "Capital2"],
            maps: Map(googleMaps: "GoogleMapsURL", openStreetMaps: "OpenStreetMapsURL"),
            flags: Flags(png: "FlagPNGURL", svg: "FlagSVGURL", alt: "FlagAlt"),
            capitalInfo: CapitalInfo(latlng: [0.0, 0.0]),
            postalCode: PostalCode(format: "Format", regex: "Regex")
        ),
        Countries(
            name: Name(common: "CountryName", official: "OfficialCountryName"),
            altSpellings: ["Alt1", "Alt2"],
            region: "Region",
            subregion: "Subregion",
            independent: true,
            status: "Status",
            capital: ["Capital1", "Capital2"],
            maps: Map(googleMaps: "GoogleMapsURL", openStreetMaps: "OpenStreetMapsURL"),
            flags: Flags(png: "FlagPNGURL", svg: "FlagSVGURL", alt: "FlagAlt"),
            capitalInfo: CapitalInfo(latlng: [0.0, 0.0]),
            postalCode: PostalCode(format: "Format", regex: "Regex")
        )
    ]

    
    
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
        let vm = ViewCountryViewModel(country: country)
        let vc = DetailsController(vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
