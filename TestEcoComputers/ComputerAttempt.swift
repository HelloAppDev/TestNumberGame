//
//  ComputerAttempt.swift
//  TestEcoComputers
//
//  Created by Мария Изюменко on 13.04.2022.
//

import UIKit

class ComputerAttempt: UIViewController {
    
    let gameModel = GameModel()
    
    lazy var hiddenNumber = gameModel.unknownNumber
    var tryCount1 = 1
    var compGuessing = 1
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle(">", for: .normal)
        button.layer.borderWidth = 0.7
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(more), for: .touchUpInside)
        return button
    }()
    
    let equalButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("=", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.7
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(currentNumber), for: .touchUpInside)
        return button
    }()
    
    let lessButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("<", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.7
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 23.0)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(less), for: .touchUpInside)
        return button
    }()
    
    lazy var tryLabel: UILabel = {
        let label = UILabel()
        label.text = "Try № \(tryCount1)"
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
    
    let yourNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Your number is -    ? "
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
    
    var min = 1
    var max = 100
    
    var searchNum = Int()
    
    func binarySearch(searchNum: Int) -> Int? {
        
        while min <= max {
            
            let mid = (min + max) / 2
            
            if searchNum < mid {
                // Search in left side of array
                max = mid - 1
            } else if searchNum > mid {
                // Search in right side of array
                min = mid + 1
            } else {
                return mid
            }
            
        }
        return nil
    }
    
    
    
    @objc func more(searchNum: Int) {
        
    }
    
    @objc func less() {
        
    }
    
    @objc func currentNumber() {
        
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
        tryLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        compGuessingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 115).isActive = true
        compGuessingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        compGuessingLabel.widthAnchor.constraint(equalToConstant: 225).isActive = true
        compGuessingLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        yourNumberLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        yourNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yourNumberLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
        yourNumberLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        myNumberLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180).isActive = true
        myNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myNumberLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
        myNumberLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
}
