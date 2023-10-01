//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Mahesh Kulkarni on 29/09/23.
//

import UIKit

class ViewController: UIViewController {

    lazy var textField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "Enter text here"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(textField)
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 10),
            textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -10),
            textField.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
        textField.delegate = self
        
        var didReturn = textFieldShouldReturn(textField)
        print(didReturn)
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("should begin")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did Begin Editin")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Should End editing")
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Did End Editing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn")
        print(textField.text ?? "")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        return true
    }
}

