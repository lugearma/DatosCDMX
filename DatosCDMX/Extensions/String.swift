//
//  String.swift
//  DatosCDMX
//
//  Created by Luis Arias on 3/4/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

extension String {
  
  func cleanTags() -> String {
    return self.replacingOccurrences(of: "</*[a-z]*>", with: "", options: .regularExpression)
  }
}
