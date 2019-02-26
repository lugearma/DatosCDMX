//
//  Alertable.swift
//  DatosCDMX
//
//  Created by Luis Arias on 2/4/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import Foundation

import UIKit

struct AlertActionComponent {
  var title: String
  var style: UIAlertAction.Style
  var handler: ((UIAlertAction) -> Void)?
  
  init(title: String, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)?) {
    self.title = title
    self.style = style
    self.handler = handler
  }
}

struct AlertComponents {
  var title: String?
  var message: String?
  var actions: [UIAlertAction]
  var completion: (() -> Void)?
  
  init(title: String?, message: String? = nil, actions: [AlertActionComponent], completion: (() -> Void)? = nil) {
    self.title = title
    self.message = message
    self.completion = completion
    self.actions = actions.map {
      UIAlertAction(title: $0.title, style: $0.style, handler: $0.handler)
    }
  }
}

protocol AlertPresentable where Self: UIViewController {
  var alertStyle: UIAlertController.Style { get }
  var alertComponents: AlertComponents { get }
}

extension AlertPresentable {
  
  private var alertTitle: String? {
    return alertComponents.title
  }
  
  private var message: String? {
    return alertComponents.message
  }
  
  private var actions: [UIAlertAction] {
    return alertComponents.actions
  }
  
  var alertStyle: UIAlertController.Style {
    return .alert
  }
  
  private var completion: (() -> Void)? {
    return alertComponents.completion
  }
  
  func presentAlert() {
    let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: alertStyle)
    actions.forEach { alert.addAction($0) }
    
    present(alert, animated: true, completion: completion)
  }
}

