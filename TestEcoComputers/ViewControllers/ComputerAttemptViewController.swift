import UIKit

protocol TriesDelegate: class {
    func updateLabel(label text: String)
        
}

class ComputerAttemptViewController: UIViewController {
    
    lazy var gameModel = GameModel(secretNumber: hiddenNumber, guesses: compGuessing)
    let tryVC = TryCountsViewController()
    
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
    
    func compGuessingPlus() {
        yourNumberLabel.text = gameModel.lastNumber
        tryLabel.text = String("Try № \(gameModel.guesses)")
    }
    
    @objc private func moreTapped() {
        gameModel.more()
        compGuessingPlus()
    }
    
    @objc private func lessTapped() {
        gameModel.less()
        compGuessingPlus()
    }
    
    @objc private func equalTapped() {
        performSegue(withIdentifier: "humanGuessing", sender: AnyObject.self)
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "humanGuessing",
           let dvc = segue.destination as? HumanAttemptViewController {
        }
    }
    
    private func setupConstraints() {
        view.addSubview(moreButton)
        view.addSubview(equalButton)
        view.addSubview(lessButton)
        view.addSubview(tryLabel)
        view.addSubview(compGuessingLabel)
        view.addSubview(yourNumberLabel)
        view.addSubview(myNumberLabel)
        
        moreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: equalButton.trailingAnchor, constant: -90).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        equalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        equalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        equalButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        equalButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        lessButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        lessButton.leadingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: 90).isActive = true
        lessButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        lessButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tryLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        tryLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        compGuessingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 115).isActive = true
        compGuessingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        compGuessingLabel.widthAnchor.constraint(equalToConstant: 225).isActive = true
        compGuessingLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        yourNumberLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        yourNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yourNumberLabel.widthAnchor.constraint(equalToConstant: 320).isActive = true
        yourNumberLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        myNumberLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180).isActive = true
        myNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myNumberLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
        myNumberLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
    }
    
}

//extension ComputerAttemptViewController: TriesDelegate {
//    func updateLabel(label text: String) {
//        String(gameModel.guesses) = text
//    }
