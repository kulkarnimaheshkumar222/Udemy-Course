//
//  ViewController.swift
//  ImageView
//
//  Created by Mahesh Kulkarni on 30/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.frame = CGRect(x: 80, y: 100, width: 250, height: 250)
        imageView.image = UIImage(named: "Dhoni")
        imageView.highlightedImage = UIImage()
        imageView.isUserInteractionEnabled = true
        imageView.isHighlighted = false
        imageView.contentMode = .scaleAspectFit
        imageView.animationImages = [UIImage(named: "Dhoni") ?? UIImage(), UIImage(named: "Dhoni_high") ?? UIImage()]
        imageView.animationDuration = 5.0
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        if imageView.isAnimating {
            print("Animating")
        } else {
            print("Not Animating")
        }
        return imageView
    }()
    
    lazy var webImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.frame = CGRect(x: 80, y: 400, width: 250, height: 250)
        let url = URL(string: "https://www.forbesindia.com/media/images/2023/Jul/img_212649_gettyimages-1148720101_bg.jpg")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }.resume()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(imageView)
        self.view.addSubview(webImageView)
    }


}

