//
//  APIClient.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/23/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

enum ApiClientError: LocalizedError {
  case unknown
}

protocol ApiClientProtocol {
  func getCategories(_ completion: @escaping (Result<Category>) -> Void)
}

extension ApiClientProtocol {
  func defaultRequest<T: Codable>(_ urlRequest: ApiClientRouter, _ completion: @escaping (Result<T>) -> Void) {
    /*guard let request = try? urlRequest.asURLRequest() else {
      completion(Result { throw ApiClientError.unknown })
      return
    }*/
    let request = URLRequest(url: URL(string: "https://datos.cdmx.gob.mx/api/datasets/1.0/search/?rows=0&facet=theme&timezone=America%2FMexico_City")!)
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      do {
        let json = try JSONDecoder().decode(T.self, from: data!)
        completion(Result { json })
      } catch {
        completion(Result { throw error })
      }
    }
    task.resume()
  }
}

final class APIClient: ApiClientProtocol {
  
  func getCategories(_ completion: @escaping (Result<Category>) -> Void) {
    defaultRequest(ApiClientRouter.categories(parameters: ["rows": 0, "facet": "theme", "timezone": "America Mexico_City"]), completion)
  }
}
