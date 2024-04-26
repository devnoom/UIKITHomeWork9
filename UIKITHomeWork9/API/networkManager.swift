//
//  networkManager.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 26.04.24.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
        func fetchCountries(completed: @escaping (Result<[Country], Error>) -> Void) {
            let urlString = "https://restcountries.com/v3.1/all"
            guard let url = URL(string: urlString) else {
                completed(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completed(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    completed(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "HTTP error"])))
                    return
                }
                
                guard let data = data else {
                    completed(.failure(NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                    return
                }
                
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data)
                    completed(.success(countries))
                } catch {
                    completed(.failure(error))
                }
            }
            task.resume()
        }
     func loadImage(from url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                completion(nil, error ?? NSError(domain: "Image loading error", code: -1, userInfo: nil))
                return
            }
            completion(image, nil)
        }.resume()
    }
    }
