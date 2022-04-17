import UIKit

class ComputerAttemptViewController: UIViewController {
    
    lazy var gameModel = GameModel(secretNumber: hiddenNumber, guesses: compGuessing)
    
    var hiddenNumber = Int()
    var compGuessing = 1
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle(">", for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 0.7
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moreTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var equalButton: UIButton = {
        let button = UIButton()
        button.setTitle("=", for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 0.7
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(equalTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var lessButton: UIButton = {
        let button = UIButton()
        button.setTitle("<", for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 0.7
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(lessTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var  tryLabel: UILabel = {
        let label = UILabel()
        label.text = "Try № \(compGuessing)"
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let compGuessingLabel: UILabel = {
        let label = UILabel()
        label.text = "Computer is guessing"
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var yourNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Your number is - 50? "
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let myNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "My number is..."
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    func setupButton() {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderWidth = 0.7
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func compGuessingSum() {
        yourNumberLabel.text = gameModel.lastNumber
        tryLabel.text = String("Try № \(gameModel.guesses)")
    }
    
    @objc private func moreTapped() {
        gameModel.more()
        compGuessingSum()
    }
    
    @objc private func lessTapped() {
        gameModel.less()
        compGuessingSum()
    }

    @objc private func equalTapped() {
        performSegue(withIdentifier: "humanGuessing", sender: AnyObject.self)
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "humanGuessing",
           let dvc = segue.destination as? HumanAttemptViewController {
        }
    }
}
