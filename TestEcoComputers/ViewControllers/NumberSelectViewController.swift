import UIKit

class NumberSelectViewController: UIViewController {

    let enterNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter The Number", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(segueToNextVC), for: .touchUpInside)
        return button
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
        textField.delegate = self
    }
    
    @objc func segueToNextVC() {
        if textField.text?.isEmpty != true {
            performSegue(withIdentifier: "passNumber", sender: AnyObject.self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passNumber",
           let dvc = segue.destination as? ComputerAttemptViewController {
            dvc.hiddenNumber = Int(textField.text ?? "100") ?? 100
        }
    }
}
