import UIKit

class TryCountsViewController: UIViewController {
    
    lazy var gameModel = GameModel(secretNumber: 0, guesses: compTries)
    
    var compTries = Int()
    var humanTries = 1
    
    weak var triesDelegate: TriesDelegate?
    
    let scoresLabel: UILabel = {
        let label = UILabel()
        label.text = "Scores:"
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var humansTriesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Your tries count:  \(humanTries)"
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var compTriesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Computer's tries count:  \(gameModel.guesses)"
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let winnerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 23.0)
        label.text = "winner"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Main menu", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backToMainScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        triesDelegate?.updateLabel(label: compTriesCountLabel.text!)
    }
    
    @objc private func backToMainScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupConstraints() {
        view.addSubview(scoresLabel)
        view.addSubview(humansTriesCountLabel)
        view.addSubview(compTriesCountLabel)
        view.addSubview(winnerLabel)
        view.addSubview(backButton)
        
        scoresLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        scoresLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoresLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        scoresLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        humansTriesCountLabel.topAnchor.constraint(equalTo: scoresLabel.topAnchor, constant: 100).isActive = true
        humansTriesCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        humansTriesCountLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
        humansTriesCountLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        compTriesCountLabel.topAnchor.constraint(equalTo: scoresLabel.topAnchor, constant: 130).isActive = true
        compTriesCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        compTriesCountLabel.widthAnchor.constraint(equalToConstant: 270).isActive = true
        compTriesCountLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        winnerLabel.bottomAnchor.constraint(equalTo: backButton.bottomAnchor, constant: -100).isActive = true
        winnerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        winnerLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        winnerLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
