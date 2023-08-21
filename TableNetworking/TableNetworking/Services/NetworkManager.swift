//
//  NetworkManager.swift
//  TableNetworking
//
//  Created by Artem on 21.08.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL, decodingError, noData
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchAvatar(from url: URL, completion: @escaping (Data) -> Void) {
        //Неизвестно сколько времени займет -> переходим в беграунд
        DispatchQueue.global().async {
            
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
    
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: Link.allUsers.url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("response status code: \(response.statusCode)")
            }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                sendFailure(with: .noData)
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let usersQuery = try decoder.decode(UsersQuery.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(usersQuery.data))
                }
            } catch {
                sendFailure(with: .decodingError)
            }
            
            func sendFailure(with error: NetworkError) {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

// MARK: = Link

extension NetworkManager {
    enum Link {
        case allUsers
        
        var url: URL {
            switch self {
            case .allUsers:
                return URL(string: "https://reqres.in/api/users")!
            }
        }
    }
}
