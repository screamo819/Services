//
//  ChooseServiceViewController.swift
//  Services
//
//  Created by AnnaEvgen on 24.05.2022.
//

import UIKit

class ChooseServiceViewController: UIViewController {
    
    let ordr: ChooseServiceModel! = nil
    var currentService: Services!
    let works = ChooseServiceModel.getWorks()
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        setupTableView()
        self.navigationItem.titleView = setupNavigationBar()
    
        let currentVC = ChooseServiceViewController()
        currentVC.hidesBottomBarWhenPushed = false
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 48
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.register(ServiceTableViewCell.self, forCellReuseIdentifier: "cell2")
        tableView.separatorStyle = .none
    }
    
    private func setupNavigationBar() -> UIView {
        let srvc = currentService
        
        let titleView = UIView()
        
        let label = UILabel()
        label.text = srvc?.title
        label.sizeToFit()
        
        let image = UIImageView()
        image.image = srvc?.image
        image.translatesAutoresizingMaskIntoConstraints = false
        
        titleView.addSubview(label)
        titleView.addSubview(image)
        
        image.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        
        label.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8).isActive = true
                
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        return titleView
    }
}

extension ChooseServiceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return works.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ServiceTableViewCell
   
        cell.title2.text = works[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { 

         let OrderFormViewController = OrderFormViewController()
         let ordr: ChooseServiceModel = works[indexPath.row]
         self.navigationController?.pushViewController(OrderFormViewController, animated: true)
         OrderFormViewController.currentOrders = ordr
         print("User selected table row \(indexPath.row + 1)")
    }
}
