//
//  NetworkingService.swift
//  FlipDishMenu
//
//  Created by 李祺 on 07/09/2020.
//  Copyright © 2020 FlipDish. All rights reserved.
//

import Foundation

enum APIError: Error {
    case clientError(description: String)
    case serverError
    case noData
    case httpError(description: String)
    case dataDecodingError
}

protocol MenuInfoFetchable {
    func fetchMenuInfo(complete completionHandler: @escaping (Result<Menu, APIError>) -> Void)
}

struct MenuInfoFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension MenuInfoFetcher: MenuInfoFetchable {
    
    func fetchMenuInfo(complete completionHandler: @escaping (Result<Menu, APIError>) -> Void) {
        guard let url = makeMenuInfoComponents().url else {
            let error = APIError.httpError(description: "Couldn't create URL")
            completionHandler(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let networkError = error {
                completionHandler(.failure(.clientError(description: networkError.localizedDescription)))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completionHandler(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let value = try decoder.decode(Menu.self, from: data)
                completionHandler(.success(value))
            }catch{
                completionHandler(.failure(.dataDecodingError))
            }
        }.resume()
    }
}


private extension MenuInfoFetcher {
    
    struct MenuInfoApi {
        static let scheme = "https"
        static let host = "menus.flipdish.co"
        static let path = "/prod/16798/e6220da2-c34a-4ea2-bb51-a3e190fc5f08.json"
    }

    
    func makeMenuInfoComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = MenuInfoApi.scheme
        components.host = MenuInfoApi.host
        components.path = MenuInfoApi.path
        
//        components.queryItems = [
//            URLQueryItem(name: "ids", value: list),
//        ]
        
        return components
    }
}
