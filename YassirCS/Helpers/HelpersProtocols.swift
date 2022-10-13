//
//  HelpersProtocols.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation
import UIKit

protocol IdentifiableCell {
    static func getIdentifier() -> String
}

extension IdentifiableCell {
    static var cellName: String {
        return String(describing: self)
    }

    static func getIdentifier() -> String {
        return self.cellName
    }
}

public protocol Alertable {}
public extension Alertable where Self: UIViewController {
    
    func showAlert(title: String = "",
                   message: String,
                   completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: completion)
        }
    }
}
