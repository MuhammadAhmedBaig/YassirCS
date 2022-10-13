//
//  MovieDetailsModel.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation

struct MovieDetailsModel: Decodable {
    var id: Int
    var title: String
    var description: String
    var releaseDate: String
    var homepageLink: String
    var posterImage: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case homepageLink = "homepage"
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
        self.homepageLink = try container.decodeIfPresent(String.self, forKey: .homepageLink) ?? ""
        let path = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        self.posterImage = "\(Constants.Media.baseURL.rawValue)\(Constants.Media.AppendingURL.originalSize.rawValue)\(path)"
    }
    
    init(id: Int,
         title: String,
         description: String,
         releaseDate: String,
         homepageLink: String,
         posterImage: String = "") {
        self.id = id
        self.title = title
        self.description = description
        self.releaseDate = releaseDate
        self.homepageLink = homepageLink
        self.posterImage = posterImage
    }
}
