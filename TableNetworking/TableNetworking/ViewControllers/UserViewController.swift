//
//  UserViewController.swift
//  TableNetworking
//
//  Created by Artem on 21.08.2023.
//

import UIKit
import Kingfisher

final class UserViewController: UIViewController {
    
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    private let networkManager = NetworkManager.shared
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        composeUser(user)
    }
    
    private func composeUser(_ user: User) {
        nameLabel.text = "\(user.firstName) \(user.lastName)"
//        networkManager.fetchAvatar(from: user.avatar) { [weak self] imageDate in
//            self?.avatarImageView.image = UIImage(data: imageDate)
//        }
        avatarImageView.kf.setImage(with: user.avatar)
    }
}
