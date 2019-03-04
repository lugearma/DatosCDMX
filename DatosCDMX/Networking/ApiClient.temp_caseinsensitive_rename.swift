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
  func getCategory(_ completion: @escaping (Result<Category>) -> Void)
}

extension ApiClientProtocol {
  func defaultRequest<T: Decodable>(_ urlRequest: ApiClientRouter, _ completion: @escaping (Result<T>) -> Void) {
    guard let request = try? urlRequest.asURLRequest() else {
      completion(Result { throw ApiClientError.unknown })
      return
    }
    
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

final class ApiClient: ApiClientProtocol {
  
  func getCategories(_ completion: @escaping (Result<Category>) -> Void) {
    let parameters: [String: Any] = ["rows": 0, "facet": "theme", "timezone": "America/Mexico_City"]
    defaultRequest(ApiClientRouter.categories(parameters: parameters), completion)
  }
  
  func getCategory(_ completion: @escaping (Result<Category>) -> Void) {
    // refine.theme=Justicia+y+seguridad&sort=modified&rows=10&start=0&extrametas=false&interopmetas=true&timezone=America%2FMexico_City
    let parameters: [String: Any] = [
      "rows": 10,
      "refine.theme": "Justicia+y+seguridad",
      "timezone": "America/Mexico_City",
      "sort": "modified",
      "start=": "0"]
    defaultRequest(ApiClientRouter.categories(parameters: parameters), completion)
  }
}
