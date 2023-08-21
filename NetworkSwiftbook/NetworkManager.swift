//
//  NetworkManager.swift
//  NetworkSwiftbook
//
//  Created by Artem on 21.08.2023.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init () {}
    
    func downloadData(from url: URL, completion: @escaping(_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else { return }
            completion(data)
        }.resume()
    }
}
