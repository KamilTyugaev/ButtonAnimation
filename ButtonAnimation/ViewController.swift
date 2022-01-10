//
//  ViewController.swift
//  ButtonAnimation
//
//  Created by IosDeveloper on 09.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let firstSpringButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("❤︎Like", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let secondSpringButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("Subscribe ●", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Like❤︎Subscribe"
        setupViews()
        setConstrains()
    }

    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(firstSpringButton)
        view.addSubview(secondSpringButton)
    }
    private func setConstrains() {
        NSLayoutConstraint.activate([
            firstSpringButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            firstSpringButton.heightAnchor.constraint(equalToConstant: 60),
            firstSpringButton.widthAnchor.constraint(equalToConstant: 240)
        ])
        NSLayoutConstraint.activate([
            secondSpringButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -350),
            secondSpringButton.heightAnchor.constraint(equalToConstant: 60),
            secondSpringButton.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
}

