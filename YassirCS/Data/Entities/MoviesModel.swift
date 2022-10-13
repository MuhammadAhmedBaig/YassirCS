//
//  NewsModel.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

struct MoviesModel: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {
    var id: Int
    var title: String
    var description: String
    var releaseDate: String
    private var path: String
    var mediaURL: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case description = "overview"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        
        self.path = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        self.mediaURL = self.makeMediaURL(fromPosterPath: self.path)
    }
    
    private func makeMediaURL(fromPosterPath path: String) -> String {
        return "\(Constants.Media.baseURL.rawValue)\(Constants.Media.AppendingURL.originalSize.rawValue)\(path)"
    }
}
