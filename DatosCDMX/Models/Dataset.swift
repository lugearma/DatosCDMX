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
  let publisher: String?
  let description: String?
  let title: String?
  let theme: Any?
  let keyword: [String]?
  
  init(from decoder: Decoder) throws {
    let map = try decoder.container(keyedBy: CodingKeys.self)
    publisher = try map.decode(.publisher)
    description = try map.decode(.description)
    title = try map.decode(.title)
    theme = try map.customeDecode(.theme)
    keyword = try map.decode(.keyword)
  }
  
  private enum CodingKeys: CodingKey {
    case theme
    case publisher
    case description
    case title
    case rawTheme
    case keyword
  }
}

extension Metas {
  var imageName: String {
    if let theme = self.theme as? Array<String> {
      let mainTheme = theme.first ?? ""
      return getImageName(mainTheme)
    }
    
    let theme = self.theme as? String
    return getImageName(theme ?? "")
  }
  
  private func getImageName(_ theme: String) -> String {
    switch theme {
    case "Movilidad": return "train"
    case "Desarrollo urbano, vivienda y territorio": return "buildings"
    case "Medio ambiente y cambio climático": return "leaf"
    case "Justicia y seguridad": return "justice"
    case "Administración y finanzas": return "coins"
    case "Infraestructura y obra pública": return "worker"
    case "Rendición de cuentas": return "supreme"
    case "Conectividad": return "antena"
    case "Educación, ciencia y tecnología": return "school"
    case "Salud": return "health"
    default: return "placeholder"
    }
  }
}

extension KeyedDecodingContainer {
  
  public func decode<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T {
    return try decode(T.self, forKey: key)
  }
  
  public func customeDecode(_ key: Key) throws -> Any {
    if let string = try? self.decode(String.self, forKey: key) {
      return string
    }
    return try self.decode(Array<String>.self, forKey: key)
  }
}
