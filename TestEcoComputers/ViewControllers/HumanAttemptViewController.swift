import UIKit

class HumanAttemptViewController: UIViewController {
    
    lazy var gameModel = GameModel(secretNumber: compNumber, guesses: humanGuesses)
    
    var computerAttempts = Int()
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
    
    func randomCompNumber() {
        while compNumber < 1 {
            let randomNumber = Int.random(in: 1..<100)
            compNumber = randomNumber
        }
    }
    
    func compGuessingPlus() {
        tryLabel.text = String("Try № \(humanGuesses)")
    }
    
    @objc func guessTapped() {
        compGuessingPlus()
        if guessingTextField.text == String(compNumber) {
            equalNumbers()
        } else if compNumber < Int(guessingTextField.text ?? "101") ?? 101 {
            humanGuesses += 1
            infoLabel.isHidden = false
            infoLabel.text = "No, my number is less than yours"
        } else {
            humanGuesses += 1
            infoLabel.isHidden = false
            infoLabel.text = "No, my number is more than yours"
        }
    }
    
    @objc private func equalNumbers() {
        performSegue(withIdentifier: "triesSegue", sender: AnyObject.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "triesSegue",
           let dvc = segue.destination as? TryCountsViewController {
            dvc.humanTries = humanGuesses
        }
    }
    
    private func setupConstraints() {
        view.addSubview(guessButton)
        view.addSubview(tryLabel)
        view.addSubview(guessingLabel)
        view.addSubview(guessingTextField)
        view.addSubview(infoLabel)
        
        guessButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        guessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        guessButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        guessButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tryLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        tryLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        guessingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        guessingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        guessingLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        guessingLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        guessingTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        guessingTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        guessingTextField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        guessingTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        infoLabel.topAnchor.constraint(equalTo: guessButton.topAnchor, constant: 80).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
}

