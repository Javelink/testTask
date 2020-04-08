//
//  APIClient.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import Foundation

struct APIClient {
    
    static func fetchResponce<T: Codable>(_ endpoint: EndpointType,
                                              withCompletion completion: @escaping (_ model: T) -> Void) {

        let urlString = "\(endpoint.baseURL.appendingPathComponent(endpoint.path))" + "\(endpoint.staticParameters)"
            
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in

            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }

            do {
                let responseObject = try JSONDecoder().decode(T.self, from: dataResponse)
                completion(responseObject)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }.resume()
    }
}
