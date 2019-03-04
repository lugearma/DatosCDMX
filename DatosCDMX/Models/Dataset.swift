//
//  Dataset.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/26/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

struct Dataset: Decodable {
  let datasetid: String?
  let metas: Metas?
}

struct Metas: Decodable {
//  let publisher: String?
//  let description: String?
//  let title: String?
  let theme: Any?
//  let keyword: [String]?
  
  init(from decoder: Decoder) throws {
    let map = try? decoder.container(keyedBy: CodingKeys.self)
    theme = try map?.decode(.theme)
  }
  
  private enum CodingKeys: CodingKey {
    case theme
  }
}



extension KeyedDecodingContainer {
  public func decode(_ key: Key) throws -> Any {
    if let string = try? self.decode(String.self, forKey: key) {
      return string
    }
    return try self.decode(Array<String>.self, forKey: key)
  }
}
