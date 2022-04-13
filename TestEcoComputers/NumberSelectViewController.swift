//
//  NumberSelectViewController.swift
//  TestEcoComputers
//
//  Created by Мария Изюменко on 13.04.2022.
//

import UIKit

class NumberSelectViewController: UIViewController {
    
    let enterNumberButton: UIButton = {
        let startButton = UIButton()
        startButton.backgroundColor = .blue
        startButton.setTitle("Enter The Number", for: .normal)
        startButton.layer.cornerRadius = 15
        startButton.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(segueToNextVC), for: .touchUpInside)
        return startButton
    }()
    
    let textField: UITextField = {
        let numberTextField = UITextField()
        numberTextField.placeholder = "Your number"
        numberTextField.textAlignment = .center
        numberTextField.borderStyle = .roundedRect
        numberTextField.keyboardType = .numberPad
        numberTextField.font = UIFont(name: "Helvetica", size: 23.0)
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        return numberTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    @objc func segueToNextVC() {
        performSegue(withIdentifier: "passNumber", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ComputerAttempt else { return }
        dvc.hiddenNumber = textField.text
    }
    
    private func setupConstraints() {
        view.addSubview(enterNumberButton)
        view.addSubview(textField)
        
        enterNumberButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        enterNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterNumberButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        enterNumberButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
