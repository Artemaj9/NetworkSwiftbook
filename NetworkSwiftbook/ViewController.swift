//
//  ViewController.swift
//  NetworkSwiftbook
//
//  Created by Artem on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!
    
    private let networkManager = NetworkManager.shared
    
    @IBAction func showNextAction(_ sender: Any) {
        fetchImage(key: "sea")
    }
}

// Networking
extension ViewController {
    private func fetchImage(key: String) {
        guard let url = URL(string: "https://loremflickr.com/320/320/\(key)") else { return }
        networkManager.downloadData(from: url) { data in
            guard let data else { return }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async { [weak self] in
                self?.photoImageView.image = image
            }
        }

    }
}

