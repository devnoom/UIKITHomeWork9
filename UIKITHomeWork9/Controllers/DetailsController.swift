//
//  DetailsController.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 25.04.24.
//

import UIKit

class DetailsController: UIViewController {

    //MARK: - Variables
    let viewModel: ViewCountryViewModel
    
    //MARK: - UI Components
    let nativeNameKey = UILabel()
  
    let spellingKey = UILabel()
  
    let capitalKey = UILabel()
   
    let statusKey = UILabel()
   let countryFlag = UIImageView()
    let regionKey = UILabel()
    let Flag: UIImageView = {
        let flag = UIImageView()
        
        return flag
    }()
    
    let postalCodeKey = UILabel()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    let headerStack: UIStackView = {
        let headerStack = UIStackView()
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        return headerStack
    }()
    let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    let aboutStack: UIStackView = {
        let aboutStack = UIStackView()
        aboutStack.axis = .vertical
        aboutStack.spacing = 5
        aboutStack.distribution = .fill
        aboutStack.alignment = .center
        return aboutStack
    }()
    let uiView = UIView()
    private lazy var infoKeyStack: UIStackView = {
        let infoKeyStack = UIStackView(arrangedSubviews: [nativeNameKey, spellingKey, capitalKey, statusKey, regionKey, postalCodeKey])
        infoKeyStack.translatesAutoresizingMaskIntoConstraints = false
        infoKeyStack.axis = .vertical
        infoKeyStack.spacing = 5
        infoKeyStack.distribution = .fill
        infoKeyStack.alignment = .leading
        return infoKeyStack
    }()
    let infoValueStack: UIStackView = {
        let infoValueStack = UIStackView()
        infoValueStack.translatesAutoresizingMaskIntoConstraints = false
        infoValueStack.axis = .vertical
        infoValueStack.spacing = 5
        infoValueStack.distribution = .fill
        infoValueStack.alignment = .trailing
        return infoValueStack
    }()
    let bottomStack: UIStackView = {
        let bottomStack = UIStackView()
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        return bottomStack
    }()
    
    //MARK: - LifeCycle
    init(_ viewModel: ViewCountryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.navigationItem.title = self.viewModel.country.name?.common
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        
        self.regionKey.text = self.viewModel.regionLabel
        self.postalCodeKey.text = self.viewModel.postalLabel
        self.statusKey.text = self.viewModel.statusLabel
        self.capitalKey.text = self.viewModel.capitalLabel
        self.nativeNameKey.text = self.viewModel.nativeNameLabel
        self.spellingKey.text = self.viewModel.spellingLabel
        self.viewModel.onImageLoaded = { [weak self] logoImage in
            DispatchQueue.main.async {
                self?.countryFlag.image = logoImage
            }
        }
        
       

    }
    
    //MARK: - UI Setup
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(Flag)
        contentView.addSubview(aboutStack)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        Flag.translatesAutoresizingMaskIntoConstraints = false
        aboutStack.translatesAutoresizingMaskIntoConstraints = false
        
        let height = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        height.priority = UILayoutPriority(1)
        height.isActive = true
        
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
            
            countryFlag.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            countryFlag.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            countryFlag.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            countryFlag.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            countryFlag.heightAnchor.constraint(equalToConstant: 200),
            //countryFlag.widthAnchor.constraint(equalToConstant: 300),
            
//            headerStack.topAnchor.constraint(equalTo: contentView.topAnchor),
//            headerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
//            headerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
//            headerStack.heightAnchor.constraint(equalToConstant: 300),
//            
//            aboutStack.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 30),
//            aboutStack.heightAnchor.constraint(equalToConstant: 150),
//            aboutStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  15),
//            aboutStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
//            infoKeyStack.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 30),
//            infoKeyStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            infoKeyStack.widthAnchor.constraint(equalToConstant: 180),
//            infoKeyStack.heightAnchor.constraint(equalToConstant: 400),
//            
//            infoValueStack.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 30),
//            infoValueStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            infoValueStack.widthAnchor.constraint(equalToConstant: 180),
//            infoValueStack.heightAnchor.constraint(equalToConstant: 400),
//            
//            bottomStack.topAnchor.constraint(equalTo: infoValueStack.bottomAnchor, constant: 30),
//            bottomStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            bottomStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            bottomStack.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
}
