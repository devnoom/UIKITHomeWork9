//
//  CountryCell.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 24.04.24.
//

import UIKit

class CountryCell: UITableViewCell {

    static let identifier = "CountryCell"
    
    // MARK: - Variables
    //private(set)
     var country: Country!
    
    // MARK: - UI Components
    
    private let CountryFlag: UIImageView = {
        let CF = UIImageView()
        return CF
    }()
    
     let CountryName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        //label.text = "Title"
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with country: Country) {
        self.country = country
        loadImage(for: country)
    }

    private func loadImage(for country: Country) {
        // Check if the country has a valid flag URL
        if let flagURLString = country.flags?.png, let flagURL = URL(string: flagURLString) {
            // Load image asynchronously
            NetworkManager.shared.loadImage(from: flagURL) { [weak self] image, error in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    if let error = error {
                        // Handle error loading image
                        print("Error loading image for \(country.name?.common ?? "Unknown country"): \(error)")
                    } else if let image = image {
                        // Assign loaded image to the country object
                        self.CountryFlag.image = image
                        // Notify delegate that the image has been loaded for this country
                        //self.delegate?.countryImageLoaded(country: country)
                    }
                }
            }
        }
    }

       
    
    
    // TODO: - PrepareForReuse
    
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(CountryFlag)
        self.addSubview(CountryName)
        
        CountryFlag.translatesAutoresizingMaskIntoConstraints = false
        CountryName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            CountryFlag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            CountryFlag.centerYAnchor.constraint(equalTo: centerYAnchor),
            CountryFlag.widthAnchor.constraint(equalToConstant: 25),
            CountryFlag.heightAnchor.constraint(equalToConstant: 25),
    
            CountryName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            CountryName.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
    }
}


// 37: 50
