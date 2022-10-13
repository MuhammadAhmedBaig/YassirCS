//
//  Coordinator.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }

    func start()
}
