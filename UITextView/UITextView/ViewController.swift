//
//  ViewController.swift
//  UITextView
//
//  Created by Mahesh Kulkarni on 02/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var displayTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    lazy var newTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 10, y: 400, width: 300, height: 50)
   //     textView.text = "Programmatic TextView"
        textView.font = .systemFont(ofSize: 25, weight: .bold)
        textView.textColor = .systemPink
        textView.textAlignment = .left
        textView.isEditable = true
        textView.isSelectable = true
        textView.dataDetectorTypes = .all
        textView.backgroundColor = .lightGray
        
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 0, width: 200, height: 200)
        label.text = "I am input view"
        label.backgroundColor = .systemPink
        
        textView.inputView = label
        textView.textContainerInset = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 20)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(newTextView)
        sendButton.configurationUpdateHandler = { [weak self]  button in
            guard let self = self else { return }
            guard let enteredText = textView.text else { return }
            
            if enteredText.isEmpty {
                sendButton.isEnabled = false
            } else {
                sendButton.isEnabled = true
            }
            
        }
    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        guard let enteredText = textView.text else { return }
        displayTextView.text = textView.text
        
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        sendButton.setNeedsUpdateConfiguration()
    }
}

