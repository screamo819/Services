//
//  TEXTFieldViewController.swift
//  Services
//
//  Created by AnnaEvgen on 28.05.2022.
//

import UIKit

class TEXTFieldViewController: UIViewController {
    
    var textButton: UIButton!
    var textField: UITextField!
    var textFieldBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemTeal
        
        textButton = UIButton()
        textField = UITextField()
        
        view.addSubview(textButton)
        view.addSubview(textField)
        
        textButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        textField.isHidden = true
        textField.delegate = self
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        createButton()
        createTextfield()
    }
    
    func createButton() {
        textButton.backgroundColor = .systemRed
        textButton.translatesAutoresizingMaskIntoConstraints = false
        textButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        textButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        textButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        textButton.heightAnchor.constraint(equalToConstant: 76).isActive = true
    }
    
    func createTextfield() {
        textField.placeholder = "text"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        textField.topAnchor.constraint(equalTo: textButton.bottomAnchor, constant: 40).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 76).isActive = true

    }
    
    var keyboardHeight: CGFloat = 0
    
    @objc func buttonPressed() {
        textField.becomeFirstResponder()
        print("button pressed")
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            self.keyboardHeight = keyboardHeight
        }
    }
}

extension TEXTFieldViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.isHidden = false
        textFieldBottomConstraint.constant = keyboardHeight
        return true
    }
}
