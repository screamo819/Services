//
//  TestViewController.swift
//  Services
//
//  Created by AnnaEvgen on 28.05.2022.
//

import UIKit

class AlarmaVC: UIViewController {

    var btn: UIButton!
    var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn = UIButton()
        lbl = UILabel()
        
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        
        lbl.isHidden = true
        view.addSubview(btn)
        view.addSubview(lbl)
        
        createbtn()
        createlbl()
    }
    
    func createbtn() {
        btn.backgroundColor = .systemGray3
        btn.setTitle("BUTTON", for: .normal)
        btn.tintColor = .green
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func createlbl() {
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        lbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        lbl.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 40).isActive = true
        lbl.heightAnchor.constraint(equalToConstant: 60).isActive = true

    }
    
    func btnClicked(sender: UIButton) {
        
        let alarma = UIAlertController(title: "Name", message: "Name eingaben...", preferredStyle: .alert)
        alarma.addTextField { (tfAlarma) in
            tfAlarma.placeholder = "Name?"
            tfAlarma.keyboardAppearance = .dark
        }
        alarma.addAction(UIAlertAction(title: "OK", style: .default, handler: { (bla) in
            self.lbl.text = alarma.textFields![0].text
            self.lbl.isHidden = false
            UIView.animate(withDuration: 5, animations: {
                self.btn.alpha = 0
            })
        }))
        alarma.addAction(UIAlertAction(title: "Abbrechen", style: .destructive, handler: nil))
        self.present(alarma, animated: true, completion: nil)
    }
}
