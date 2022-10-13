//
//  YCSError.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

struct YCSError {
    let message: String

    init(message: String) {
        self.message = message
    }
}

extension YCSError: LocalizedError {
    var errorDescription: String? { return message }
}
