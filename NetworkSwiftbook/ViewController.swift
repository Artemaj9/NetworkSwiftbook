//
//  ViewController.swift
//  NetworkSwiftbook
//
//  Created by Artem on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showNextAction(_ sender: Any) {
        fetchImage()
    }
}

// Networking
extension ViewController {
    func fetchImage() {
        guard let url = URL(string: "https://loremflickr.com/320/320") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error  in
            
            guard let data, error == nil else { return }
            let image = UIImage(data: data)
            
            DispatchQueue.main.async { [weak self] in
                self?.photoImageView.image = image
            }
        }
        .resume()
    }
}

