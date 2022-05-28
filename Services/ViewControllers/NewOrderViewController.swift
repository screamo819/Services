//
//  ViewController.swift
//  Services
//
//  Created by AnnaEvgen on 14.05.2022.
//

import UIKit

class NewOrderViewController: UIViewController {
   
    let label = UILabel()
    let customButton = NewPerformerButton()
   
    let services = Services.getServices()
    
    var filtredServices: [Services] = []
    var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Новый заказ"
        
        view.addSubview(label)
        view.addSubview(customButton)
        
        setupCustomButton()
        tableView = UITableView()
        setupTableView()
        setupSearchController()
        setupHelpLabel()
    }
    
    func setupHelpLabel() {
      
        label.backgroundColor = .systemBackground
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .left
        label.text = "Чем помочь?"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        label.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 16).isActive = true
        label.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .systemCyan
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Услуга или специалист"
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func setupCustomButton() {
        customButton.translatesAutoresizingMaskIntoConstraints = false
        customButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        customButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        customButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        customButton.heightAnchor.constraint(equalToConstant: 76).isActive = true
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 48
        
        setupTableViewHeader()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
    }
    
    private func setupTableViewHeader() {
        let header = HeaderView(frame: .zero)
        header.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tableView.tableHeaderView = header
    }
}

// MARK: - TableViewDataSource & Delegate

extension NewOrderViewController:  UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filtredServices.count
        }
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        let _ = isFiltering ? filtredServices[indexPath.row]
        : services[indexPath.row]
        
        cell.title.text = services[indexPath.row].title
        cell.titleDescription.text = services[indexPath.row].description
        cell.serviceImage.image = services[indexPath.row].image
        
        cell.serviceImage.layer.cornerRadius = cell.serviceImage.frame.size.height / 2
        cell.serviceImage.clipsToBounds = true
        
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let srvc: Services = isFiltering ? filtredServices[indexPath.row]
        : services[indexPath.row]
        
        let ChooseServiceViewController = ChooseServiceViewController()
        
        self.navigationController?.pushViewController(ChooseServiceViewController, animated:  true)
        ChooseServiceViewController.currentService = srvc
        print("User selected table row \(indexPath.row + 1)")
    }
}

// MARK: - SearchResult

extension NewOrderViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText (_ searchText: String) {
        filtredServices = services.filter { (services: Services) -> Bool in
            services.title.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}
