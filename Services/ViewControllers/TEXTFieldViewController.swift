//
//  TEXTFieldViewController.swift
//  Services
//
//  Created by AnnaEvgen on 28.05.2022.
//

import UIKit

class TEXTFieldViewController: UIViewController {
    
    var updatingData: String = ""
    var dataUpdateClosure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 24
        createTextfieldView()
        createButtonStackView()
    }

    var textField = UITextField()
    func setupTextField() {
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = .systemGreen
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 16
        textField.placeholder = "Что нужно сделать?"
        textField.becomeFirstResponder()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    var closeButton = UIButton()
    func setupCloseButton() {
        closeButton.setTitle("Закрыть", for: .normal)
        closeButton.setTitleColor(.systemGreen, for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
    }
    
    @objc func closePressed() {
        print("close button pressed")
        dismiss(animated: true)
    }
    
    var doneButton = UIButton()
    func setupDoneButton() {
        doneButton.setTitle("Готово", for: .normal)
        doneButton.setTitleColor(.systemGreen, for: .normal)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
    }
    
    @objc func donePressed() {
        print("done button pressed")
        let updatedData = textField.text ?? ""
        dataUpdateClosure?(updatedData)
        self.dismiss(animated: true)
    }
    
    var buttonStack = UIStackView()
    func setupButtonStack() {
        buttonStack.addArrangedSubview(closeButton)
        buttonStack.addArrangedSubview(doneButton)
        buttonStack.axis = .horizontal
        buttonStack.distribution = .equalCentering
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
    }

    func createButtonStackView() {
        
        view.addSubview(buttonStack)
        setupCloseButton()
        setupDoneButton()
        setupButtonStack()
        
        buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonStack.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16).isActive = true
        buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    func createTextfieldView() {
        
        setupTextField()
        view.addSubview(textField)

        textField.topAnchor.constraint(equalTo: view.topAnchor, constant:  12).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}

extension TEXTFieldViewController: UITextFieldDelegate {
    @objc private func textFieldChanged() {
        if textField.text?.isEmpty == false {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
}
