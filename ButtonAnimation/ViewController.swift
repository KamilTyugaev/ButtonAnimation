//
//  ViewController.swift
//  ButtonAnimation
//
//  Created by IosDeveloper on 09.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var firstSpringButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        button.setTitle("❤︎Like", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(firstSpringButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let secondSpringButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        button.setTitle("Subscribe 😍", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(secondSpringButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var firstButtonSpringConstraint: NSLayoutConstraint!
    private var secondButtonSpringConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Like"
        setupViews()
        setConstrains()
        
        firstButtonSpringConstraint.constant -= view.bounds.width
        secondButtonSpringConstraint.constant -= view.bounds.width
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.firstButtonSpringConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut) {
            self.secondButtonSpringConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
    }
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(firstSpringButton)
        view.addSubview(secondSpringButton)
    }
    @objc private func firstSpringButtonTapped(){
        let bounds = firstSpringButton.bounds
    
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: .curveEaseInOut) {
            self.firstSpringButton.bounds = CGRect(
                x: bounds.origin.x - 50,
                y:bounds.origin.y,
                width: bounds.width + 200,
                height: bounds.height)
            //анимация с текстом первой кнопки
            self.firstSpringButton.titleLabel?.frame = CGRect(
                x: bounds.origin.x - 30,
                y: bounds.height / 2,
                width: bounds.width + 60,
                height: 0)
            self.firstSpringButton.setTitle("Subscribe😁", for:  .normal)
        }
    }
    @objc private func secondSpringButtonTapped(){
        let bounds = secondSpringButton.bounds
        guard let titleFrame = secondSpringButton.titleLabel?.frame else { return }
    
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: .curveEaseInOut) {
            self.secondSpringButton.bounds = CGRect(
                x: bounds.origin.x - 50,
                y:bounds.origin.y,
                width: bounds.width + 100,
                height: bounds.height)
            //анимация с текстом второй кнопки
            self.secondSpringButton.titleLabel?.frame = CGRect(
                x: titleFrame.origin.x + titleFrame.width,
                y: titleFrame.origin.y,
                width: titleFrame.width * 2,
                height: titleFrame.height)
        }
        
    }
    private func setConstrains() {
        firstButtonSpringConstraint = NSLayoutConstraint(
            item: firstSpringButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        self.view.addConstraint(firstButtonSpringConstraint)
        NSLayoutConstraint.activate([
            firstSpringButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            firstSpringButton.heightAnchor.constraint(equalToConstant: 60),
            firstSpringButton.widthAnchor.constraint(equalToConstant: 240)
        ])
        secondButtonSpringConstraint = NSLayoutConstraint(item: secondSpringButton, attribute: .centerX,
                                                          relatedBy: .equal, toItem: self.view, attribute: .centerX,
                                                          multiplier: 1, constant: 0)
        view.addConstraint(secondButtonSpringConstraint)
        
        NSLayoutConstraint.activate([
            secondSpringButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -350),
            secondSpringButton.heightAnchor.constraint(equalToConstant: 60),
            secondSpringButton.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
}

