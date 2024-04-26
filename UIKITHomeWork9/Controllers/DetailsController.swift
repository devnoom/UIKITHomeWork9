//
//  DetailsController.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 25.04.24.
//

import UIKit
import SafariServices

class DetailsController: UIViewController {
    
    //MARK: - Variables
    
    private var country: Country
    
    //MARK: - UI Components
    let countryFlag = UIImageView()
    let nativeNameKey = UILabel()
    let spellingKey = UILabel()
    let capitalKey = UILabel()
    let statusKey = UILabel()
    let regionKey = UILabel()
    let postalCodeKey = UILabel()
    
    let nativeNameValue = UILabel()
    let spellingValue = UILabel()
    let capitalValue = UILabel()
    let statusValue = UILabel()
    let regionValue = UILabel()
    let postalCodeValue = UILabel()
    
    private let AboutLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let TextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
   
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private lazy var aboutStack: UIStackView = {
        let aboutStack = UIStackView(arrangedSubviews: [AboutLabel, TextLabel])
        aboutStack.axis = .vertical
        aboutStack.alignment = .leading
        aboutStack.distribution = .equalCentering
        return aboutStack
    }()
    
    private lazy var infoKeyStack: UIStackView = {
        let infoKeyStack = UIStackView(arrangedSubviews: [nativeNameKey, spellingKey, capitalKey, statusKey, regionKey, postalCodeKey])
        infoKeyStack.translatesAutoresizingMaskIntoConstraints = false
        infoKeyStack.axis = .vertical
        infoKeyStack.spacing = 5
        infoKeyStack.distribution = .equalSpacing
        infoKeyStack.alignment = .leading
        return infoKeyStack
    }()
    
    private lazy var infoValueStack: UIStackView = {
        let infoValueStack = UIStackView(arrangedSubviews: [nativeNameValue, spellingValue, capitalValue, statusValue, regionValue, postalCodeValue])
        infoValueStack.translatesAutoresizingMaskIntoConstraints = false
        infoValueStack.axis = .vertical
        infoValueStack.spacing = 5
        infoValueStack.distribution = .equalSpacing
        infoValueStack.alignment = .trailing
        return infoValueStack
    }()
    
    let bottomStack: UIStackView = {
        let bottomStack = UIStackView()
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        return bottomStack
    }()
    
    //MARK: - LifeCycle
    init(country: Country) {
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.configureBottomStack()
       
        
        
    }
    
    //MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .white
        
        self.navigationItem.title = self.country.name?.common
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        
        self.regionKey.text = "region:"
        self.postalCodeKey.text = "postal:"
        self.statusKey.text = "status:"
        self.capitalKey.text = "capital:"
        self.nativeNameKey.text = "native:"
        self.spellingKey.text = "spelling:"
        
        self.regionValue.text = self.country.region?.description
        self.postalCodeValue.text = self.country.postalCode?.regex?.description
        self.statusValue.text = self.country.status?.description
        self.capitalValue.text = self.country.capital?.description
        self.nativeNameValue.text = self.country.name?.common
        self.spellingValue.text = self.country.altSpellings?.description
        
        self.AboutLabel.text = "About the flag"
        self.TextLabel.text = "Flag of Georgia itself represents a white cloth with five red crosses, one central (St. George) and four equilateral (Bolnisski) crosses in the four quadrants. Rectangular and four small cross on a white background are the general Christian symbols that embody Jesus Christ the Savior and the four evangelists."
        if let flagURLString = country.flags?.png, let flagURL = URL(string: flagURLString) {
                NetworkManager.shared.loadImage(from: flagURL) { [weak self] image, error in
                    guard let self = self else { return }
                    DispatchQueue.main.async {
                        if let error = error {
                            // Handle error loading image
                            print("Error loading image for \(self.country.name?.common ?? "Unknown country"): \(error)")
                        } else if let image = image {
                            // Assign loaded image to the countryFlag imageView
                            self.countryFlag.image = image
                        }
                    }
                }
            }
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(countryFlag)
        contentView.addSubview(aboutStack)
        contentView.addSubview(infoKeyStack)
        contentView.addSubview(infoValueStack)
        contentView.addSubview(bottomStack)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        aboutStack.translatesAutoresizingMaskIntoConstraints = false
        infoKeyStack.translatesAutoresizingMaskIntoConstraints = false
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo:scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.5),
            
            countryFlag.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            countryFlag.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            countryFlag.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            countryFlag.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            countryFlag.heightAnchor.constraint(equalToConstant: 200),
            
            
            
            aboutStack.topAnchor.constraint(equalTo: countryFlag.bottomAnchor, constant: 20),
            aboutStack.heightAnchor.constraint(equalToConstant: 150),
            aboutStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            aboutStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            infoKeyStack.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 40),
            infoKeyStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoKeyStack.widthAnchor.constraint(equalToConstant: 180),
            infoKeyStack.heightAnchor.constraint(equalToConstant: 400),
            
            infoValueStack.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 40),
            infoValueStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            infoValueStack.widthAnchor.constraint(equalToConstant: 180),
            infoValueStack.heightAnchor.constraint(equalToConstant: 400),
            
            bottomStack.topAnchor.constraint(equalTo: infoValueStack.bottomAnchor, constant: 20),
            bottomStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomStack.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    func configureBottomStack() {
        let googleMapsImage = UIImage(named: "map")
        let googleMapsImageView = UIImageView(image: googleMapsImage)
        googleMapsImageView.contentMode = .scaleAspectFit
        googleMapsImageView.isUserInteractionEnabled = true
        let googleMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openGoogleMaps))
        googleMapsImageView.addGestureRecognizer(googleMapsTapGesture)
        googleMapsImageView.heightAnchor.constraint(equalToConstant: (googleMapsImage?.size.height ?? 0) * 3).isActive = true
        googleMapsImageView.widthAnchor.constraint(equalToConstant: (googleMapsImage?.size.width ?? 0) * 3).isActive = true
        
        let openStreetMapsImage = UIImage(named: "street")
        let openStreetMapsImageView = UIImageView(image: openStreetMapsImage)
        openStreetMapsImageView.contentMode = .scaleAspectFit
        openStreetMapsImageView.isUserInteractionEnabled = true
        let openStreetMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openOpenStreetMaps))
        openStreetMapsImageView.addGestureRecognizer(openStreetMapsTapGesture)
        openStreetMapsImageView.heightAnchor.constraint(equalToConstant: (openStreetMapsImage?.size.height ?? 0) * 3).isActive = true
        openStreetMapsImageView.widthAnchor.constraint(equalToConstant: (openStreetMapsImage?.size.width ?? 0) * 3).isActive = true
        
        bottomStack.axis = .horizontal
        bottomStack.alignment = .center
        bottomStack.distribution = .fillEqually
        
        bottomStack.addArrangedSubview(googleMapsImageView)
        bottomStack.addArrangedSubview(openStreetMapsImageView)
    }

 

        
        @objc func openGoogleMaps() {
            if let googleMapsURL = URL(string: country.maps?.googleMaps ??  "https://maps.google.com") {
                let safariViewController = SFSafariViewController(url: googleMapsURL)
                present(safariViewController, animated: true, completion: nil)
            }
        }
        
        @objc func openOpenStreetMaps() {
            if let openStreetMapsURL = URL(string: country.maps?.openStreetMaps ?? "https://www.openstreetmap.org") {
                let safariViewController = SFSafariViewController(url: openStreetMapsURL)
                present(safariViewController, animated: true, completion: nil)
            }
        }
}
