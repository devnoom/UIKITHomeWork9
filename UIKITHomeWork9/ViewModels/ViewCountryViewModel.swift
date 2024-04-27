//
//  ViewCountryViewModel.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 25.04.24.
//

import UIKit

protocol ViewCountryViewModelDelegate: AnyObject {
    func countriesFetched(_ countries: [Country])
    func navigateToDetailsVC(country: Country)
    
}

final class ViewCountryViewModel {
    private let networking = NetworkManager.shared
       private var countries: [Country] = []
       var filtredCountries: [Country] = []
       
       weak var delegate: ViewCountryViewModelDelegate?
       
       // Define onCountryUpdated closure
       var onCountryUpdated: (() -> Void)?
    
    
    func viewDidLoad() {
        fetchCountries()
        
    }
    
    func didSelectRowAt(index: IndexPath) {
        delegate?.navigateToDetailsVC(country: countries[index.row])
    }
    
    private func fetchCountries() {
        networking.fetchCountries { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let countries):
                self.countries = countries
                DispatchQueue.main.async {
                    self.delegate?.countriesFetched(countries)
                }
            case .failure(let error):
                // Handle error
                print("Failed to fetch countries: \(error)")
            }
        }
    }
    

}

//extension ViewCountryViewModel {
//    public func inSearchMode(_ searchController: UISearchController) -> Bool {
//         let isActive = searchController.isActive {
//            let searchText = searchController.searchBar.text ?? ""
//            return isActive && !searchText.isEmpty
//         }
//    }
//    
//    public func updateSearchController(searchBarText: String?) {
//        self.filtredCountries = countries
//        
//        if let searchText = searchBarText?.lowercased() {
//            guard !searchText.isEmpty else { self.onCountryUpdated?(); return }
//            
//            self.filtredCountries = self.filtredCountries.filter({$0.name?.common?.description.lowercased().contains(searchText) ?? false})
//        }
//        self.onCountryUpdated?()
//    }
//}




