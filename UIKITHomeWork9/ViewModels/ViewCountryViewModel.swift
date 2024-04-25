//
//  ViewCountryViewModel.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 25.04.24.
//

import UIKit

class ViewCountryViewModel {
    
    var onImageLoaded: ((UIImage?)-> Void)?
    
    //MARK: - Variables
    let country: Countries
    
    //MARK: - Initializer
    init(country: Countries) {
        self.country = country
        self.loadImage()
    }
    
    private func loadImage() {
        
        DispatchQueue.global().async { [weak self] in
            if let flagsURL = self?.country.flagURL,
               let imageData = try? Data(contentsOf: flagsURL),
               let countryFlag = UIImage(data: imageData) {
                self?.onImageLoaded?(countryFlag)
            }
        }
        }
        //MARK: - Computed Properties
        var regionLabel: String {
            "Region: \(country.region?.description ?? "america")"
        }
        var nativeNameLabel: String {
            "Name: \(country.name?.common?.description ?? "america")"
        }
        var spellingLabel: String {
            "Spelling: \(country.altSpellings?.description ?? "america")"
        }
        var capitalLabel: String {
            "Capital: \(country.capital?.description ?? "america")"
        }
        var statusLabel: String {
            "status: \(country.status?.description ?? "america")"
        }
        var postalLabel: String {
            "Postal: \(country.postalCode?.format?.description ?? "america")"
        }
        
    }

