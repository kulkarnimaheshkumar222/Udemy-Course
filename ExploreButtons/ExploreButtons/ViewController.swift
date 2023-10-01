//
//  ViewController.swift
//  ExploreButtons
//
//  Created by Mahesh Kulkarni on 28/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    var newButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y: 175, width: 300, height: 50)
        button.configuration = .tinted()
        button.configuration?.baseBackgroundColor = .systemPink
        button.configuration?.baseForegroundColor = .systemPink
        button.configuration?.title = "Learn Button Programmtically "
        button.configuration?.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        button.configuration?.subtitle = "These changes are observed in iOS 15"
        button.configuration?.titleAlignment = .center
        
        button.configuration?.image = UIImage(systemName: "book.fill")
        button.configuration?.imagePlacement = .leading
        button.configuration?.imagePadding = 10
        
        button.addAction(UIAction(handler: {_ in
            print("Programmatically create button Clicked")
        }), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // configureButton()
        self.view.addSubview(newButton)
        configureButton()
    }
    
    func configureButton() {
        button.configuration = .tinted()
        button.configuration?.baseBackgroundColor = .systemPink
        button.configuration?.baseForegroundColor = .systemPink
        button.configuration?.title = "Learn Button Story Board"
        button.configuration?.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        button.configuration?.subtitle = "These changes are observed in iOS 15"
        button.configuration?.titleAlignment = .center
        
        button.configuration?.image = UIImage(systemName: "book.fill")
        button.configuration?.imagePlacement = .leading
        button.configuration?.imagePadding = 10
    
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        print("Story Board button Clicked")
       
    }

}

