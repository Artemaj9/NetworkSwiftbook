//
//  UserTableViewCell.swift
//  TableNetworking
//
//  Created by Artem on 21.08.2023.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {

    @IBOutlet var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 5
        }
    }
    @IBOutlet var nameLabel: UILabel!
    
    func configure(with user: User) {
        nameLabel.text = "\(user.firstName) \(user.lastName)"
        avatarImageView.kf.setImage(with: user.avatar)
    }
}
