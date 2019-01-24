//
//  ApiClientRouter.swift
//  DatosCDMX
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

enum ApiClientRouter {
  case categories(parameters: [String: Any])
}

extension ApiClientRouter {
  var baseURLAsString: String {
    guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
      preconditionFailure("Cannot get BaseURL")
    }
    
    return baseURL
  }
  
  func asURLRequest() throws -> URLRequest {
    let result: (path: String, parameters: [String: Any]) = {
      switch self {
      case .categories(let parameters):
        #warning("Check way to remove hard coded string")
        return ("/api/datasets/1.0/search/", parameters)
      }
    }()
    
    let baseURL = URL(string: baseURLAsString)
    let urlAppendedPath = baseURL?.appendingPathComponent(result.path)
    var components = URLComponents(url: urlAppendedPath!, resolvingAgainstBaseURL: true)
    components?.queryItems = buildQueryItemsFrom(parameters: result.parameters)
    guard let url = components?.url else {
      preconditionFailure("Cannot get URL")
    }
    let urlRequest = URLRequest(url: url)
    return urlRequest
  }
  
  private func buildQueryItemsFrom(parameters: [String: Any]) -> [URLQueryItem] {
    var queryItems: [URLQueryItem] = []
    for parameter in parameters {
      let queryItem = URLQueryItem(name: parameter.key, value: String(describing: parameter.value))
      queryItems.append(queryItem)
    }
    
    return queryItems
  }
}
