//
//  Extensions.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation
import UIKit

struct ImageCache {
    private static let defaults = UserDefaults.standard
//    private static let cache = NSCache<String, UIImage>()
    static func saveImage(withURL url: URL, andData data: Data) {
        deleteCache(forURL: url)
        defaults.set(data, forKey: url.absoluteString)
    }
    
    static func getImage(fromURL url: URL) -> UIImage? {
        if let imageData = defaults.value(forKey: url.absoluteString) as? Data, let image = UIImage(data: imageData) {
            return image
        }
        return nil
    }
    
    static func deleteCache(forURL url: URL) {
        defaults.removeObject(forKey: url.absoluteString)
    }
}

extension UIImageView {
    
    func setImage(from urlString: String?) {
        self.image = UIImage.placeholder
        guard let urlString = urlString, let url = URL(string: urlString) else {
            //Not a valid URL
            return
        }
        if let image = ImageCache.getImage(fromURL: url) {
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
            return
        }
        downloadImage(from: url)
    }
    
    private func downloadImage(from url: URL) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self, let data = data, error == nil, let image = UIImage(data: data) else {
                    //Unable to download Image
                    return
                }
                ImageCache.saveImage(withURL: url, andData: data)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            }.resume()
        }
    }
    
}


extension UIImage {
    static let placeholder = UIImage(named: "placeholder")
}
