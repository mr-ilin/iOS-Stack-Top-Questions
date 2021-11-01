//
//  User.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 22.10.2021.
//

import Foundation
import UIKit

struct User {
    let name: String?
    let reputation: Int?
    let profileImageURL: URL?
    var profileImage: UIImage?
}


extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case reputation
        case name = "display_name"
        case profileImageURL = "profile_image"
    }
}
