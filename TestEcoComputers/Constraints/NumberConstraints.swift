import UIKit

extension NumberSelectViewController {
    
    func setupConstraints() {
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
}
