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
    private(set) var country: countries!
    
    // MARK: - UI Components
    
    private let CountryFlag: UIImageView = {
        let CF = UIImageView()
        CF.contentMode = .scaleAspectFit
        CF.image = UIImage(systemName: "square")
        CF.tintColor = .black
        CF.backgroundColor = .systemBlue
        return CF
    }()
    
    private let CountryName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "Title"
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
    
    public func configure(with countries: countries) {
        self.country = countries
        
        self.CountryName.text = countries.name?.common
        if let flags = country?.flags, let pngURLString = flags.png, let url = URL(string: pngURLString) {
            loadImage(from: url) { (image, error) in
                DispatchQueue.main.async {
                    if let image = image {
                        self.CountryFlag.image = image
                    } else {
                        print("Error loading image:", error?.localizedDescription ?? "Unknown error")
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
