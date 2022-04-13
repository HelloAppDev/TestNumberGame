//
//  ViewController.swift
//  TestEcoComputers
//
//  Created by Мария Изюменко on 13.04.2022.
//

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
    
    // Доделать описание и внедрить лвл
    let descriptionLabel: UILabel = {
        let description = UILabel()
        
        return description
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    @objc func segueToNextVC() {
        performSegue(withIdentifier: "startGame", sender: nil)
    }
    
    func setupConstraints() {
        view.addSubview(button)
        view.addSubview(label)
        
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 350).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
}

