//
//  OrderFormViewController.swift
//  Services
//
//  Created by AnnaEvgen on 26.05.2022.
//

import UIKit

class OrderFormViewController: UIViewController, UINavigationControllerDelegate {
    
    var imageIsChanged = false
    var currentOrders: ChooseServiceModel!
    var orders = OrderFormModel.getOrderValues()
    var tableView: UITableView!
    var createButton: UIButton!
    let customButton = NewPerformerButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = setupNavigationBar()
        tableView = UITableView()
        setupTableView()
        
        createButton = CreateButton(.init(title: "Создать заказ", closure: addOrder))
        view.addSubview(createButton)
        view.addSubview(customButton)
        setupCreateOrderButton()
        setupCustomButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func setupNavigationBar() -> UIView {
        let titleView = UIView()
        
        let ords = currentOrders
        let label = UILabel()
        label.text = ords?.title
        label.sizeToFit()
        
        titleView.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        return titleView
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 48
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.register(OrderFormCell.self, forCellReuseIdentifier: "cell3")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    func setupCreateOrderButton() {
    
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        createButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16).isActive = true
        createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16).isActive = true
        createButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180).isActive = true
    }
    
    func setupCustomButton() {
        customButton.translatesAutoresizingMaskIntoConstraints = false
        customButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        customButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        customButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 40).isActive = true
        customButton.heightAnchor.constraint(equalToConstant: 76).isActive = true
    }
    
    // MARK: - TableViewHeader
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! HeaderView
        header.contentView.backgroundColor = .systemGray5
        
        header.label.text = "Создайте заказ и получите предложения от заинтересованных исполнителей"
        header.label.font = UIFont.systemFont(ofSize: 14)
        header.label.numberOfLines = 0
        
        header.image.image = UIImage(systemName: "pencil")
        header.image.tintColor = .red
        header.image.layer.masksToBounds = true
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
// MARK: - Actions
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 || indexPath.row == 2 {
// MARK: - EnterText
            
         let textFieldVC = TEXTFieldViewController()
            
            if let sheet = textFieldVC.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.selectedDetentIdentifier = .medium
                sheet.largestUndimmedDetentIdentifier = .large
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.prefersEdgeAttachedInCompactHeight = false
                sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 24
            }
            
            present(textFieldVC, animated: true)
            
            textFieldVC.dataUpdateClosure = { [ weak self ] updatedText in
                self?.orders[indexPath.row].textFieldText = updatedText
                tableView.reloadData()
            }
            
        } else if indexPath.row == 1 {
            
// MARK: - ImagePicker
            
            let cameraIcon = UIImage(systemName: "camera")
            let photoIcon = UIImage (systemName: "photo.artframe")
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Камера", style: .default) {_ in
                self.choseImagePicker(source: .camera)
            }
            
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Выбрать из галереи", style: .default) {_ in
                self.choseImagePicker(source: .photoLibrary )
            }
            
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
            
        } else if indexPath.row == 3 {
            
// MARK: - DatePicker
            
            
            
            
        } else if  indexPath.row == 4 {
// MARK: - Enter price
            
        }
        
        else {
            view.endEditing(true)
        }
    }
}

// MARK: - TableViewDataSource

extension OrderFormViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
}

// MARK: - TableViewDelegate

extension OrderFormViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! OrderFormCell
        
        cell.textField.text = orders[indexPath.row].textFieldText
        
        if cell.textField.text == orders[indexPath.row].textFieldText {
            cell.textField.textColor = .systemGray4
        } else {
            cell.textField.textColor = .black
        }
        
        cell.image.image = orders[indexPath.row].image
        return cell
        
    }
}

//  MARK: - ImagePickerDelegate
extension OrderFormViewController: UIImagePickerControllerDelegate {
    
    func choseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = UIImageView()
        image.image = info[.editedImage] as? UIImage
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        imageIsChanged = true
        dismiss(animated: true)
    }
}

private extension OrderFormViewController {
    private func addOrder() {
        print("Заказ добавлен в Мои заказы")
    }
}
