import UIKit

class HumanAttemptViewController: UIViewController {
    
    lazy var gameModel = GameModel(secretNumber: compNumber, guesses: humanGuesses)
    
    var humanGuesses = 1
    lazy var compNumber = Int()
    
    let guessButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Guess", for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(guessTapped), for: .touchUpInside)
        return button
    }()
    
    let  tryLabel: UILabel = {
        let label = UILabel()
        label.text = "Try № 1"
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let  guessingLabel: UILabel = {
        let label = UILabel()
        label.text = "You're guessing"
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let guessingTextField: UITextField = {
        let numberTextField = UITextField()
        numberTextField.placeholder = "Try to guess the number"
        numberTextField.textAlignment = .center
        numberTextField.borderStyle = .roundedRect
        numberTextField.keyboardType = .numberPad
        numberTextField.font = UIFont(name: "Helvetica", size: 23.0)
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        return numberTextField
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.isHidden = true
        setupConstraints()
        randomCompNumber()
    }
    
    @objc func equalNumbers() {
        performSegue(withIdentifier: "triesSegue", sender: AnyObject.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "triesSegue",
           let dvc = segue.destination as? TryCountsViewController {
            dvc.humanTries = humanGuesses
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

