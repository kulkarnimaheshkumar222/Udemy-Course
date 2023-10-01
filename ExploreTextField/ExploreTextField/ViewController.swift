//
//  ViewController.swift
//  ExploreTextField
//
//  Created by Mahesh Kulkarni on 28/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displaLbl: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    var currentText = ""
    
    var secondTextField: UITextField = {
       let textField = UITextField()
        textField.frame = CGRect(x: 16, y: 600, width: 300, height: 30)
        textField.textColor = .systemPink
        textField.font = .systemFont(ofSize: 18)
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password here"
        textField.clearButtonMode = .always
        textField.background = UIImage(systemName: "book.fill")
        if textField.isEditing {
            print("Editing")
        } else {
            print("Not Editing")
        }
        
        let rect = textField.borderRect(forBounds:textField.bounds)
        print(rect)
        
        let leftLbl = UILabel()
        leftLbl.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        leftLbl.textColor = .white
        leftLbl.backgroundColor = .systemPink
        leftLbl.text = "left"
        
        textField.leftView = leftLbl
        textField.leftViewMode = .always
        
        let rightLbl = UILabel()
        rightLbl.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        rightLbl.textColor = .white
        rightLbl.backgroundColor = .systemPink
        rightLbl.text = "Right"
        
        textField.rightView = rightLbl
        textField.rightViewMode = .always
        
        return textField
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userTextField.delegate = self
        secondTextField.delegate = self
        submitButton.addAction(UIAction(handler: { [weak self] _ in
            if !(self?.userTextField.text?.isEmpty ?? false) {
                self?.displaLbl.text = "Entered Values is: \(self?.userTextField.text ?? "")"
            }
        }), for: .touchUpInside)
     
        submitButton.configurationUpdateHandler = { [unowned self]  button in
            if currentText.isEmpty {
                button.isEnabled = false
            } else {
                button.isEnabled = true
            }
        }
        self.view.addSubview(secondTextField)
        secondTextField.addAction(UIAction(handler: { [weak self] _ in
            print("hello")
            self?.displaLbl.text = "\(self?.secondTextField.text?.count ?? 0)"
        }), for: .valueChanged)
    }
    
    
    @IBAction func didChangeTextField(_ sender: UITextField) {
        displaLbl.text = "\(sender.text?.count ?? 0)"
    }
    

}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let previousText:NSString = textField.text! as NSString
        let updatedText = previousText.replacingCharacters(in: range, with: string)
        print("updatedText > ", updatedText)
        currentText = updatedText
        
        submitButton.setNeedsUpdateConfiguration()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = ""
        currentText = textField.text ?? ""
        submitButton.setNeedsUpdateConfiguration()
        return true
    }
}

