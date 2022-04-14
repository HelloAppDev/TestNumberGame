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
        enterNumberButton.isEnabled = false
        enterNumberButton.backgroundColor = .systemBlue
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)

    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true)
    }
    
    @objc func segueToNextVC() {
        if textField.text?.isEmpty != true {
            performSegue(withIdentifier: "passNumber", sender: AnyObject.self)
        } else {
            showAlert(message: "Please fill the text field")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passNumber",
        let dvc = segue.destination as? ComputerAttempt {
        dvc.hiddenNumber = Int(textField.text ?? "100")
        }
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

extension NumberSelectViewController: UITextFieldDelegate {
    
    @objc private func textFieldChanged() {
        if textField.text?.isEmpty == false {
            enterNumberButton.isEnabled = true
            enterNumberButton.backgroundColor = .blue

        } else {
            enterNumberButton.isEnabled = false
            enterNumberButton.backgroundColor = .systemBlue
        }
    }
}
