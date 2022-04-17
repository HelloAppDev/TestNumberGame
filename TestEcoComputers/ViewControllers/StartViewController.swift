import UIKit

class StartViewController: UIViewController {
    
    let button: UIButton = {
        let startButton = UIButton()
        startButton.backgroundColor = .blue
        startButton.setTitle("Start New Game", for: .normal)
        startButton.layer.cornerRadius = 15
        startButton.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(segueToNextVC), for: .touchUpInside)
        return startButton
    }()
    
    let label: UILabel = {
        let startLabel = UILabel()
        startLabel.text = "My Game"
        startLabel.font = UIFont(name: "Helvetica", size: 23.0)
        startLabel.textColor = .black
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        return startLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    @objc func segueToNextVC() {
        performSegue(withIdentifier: "startGame", sender: nil)
    }
}

