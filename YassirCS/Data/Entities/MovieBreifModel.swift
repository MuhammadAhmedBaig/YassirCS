//
//  MovieBreifModel.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

enum MediaType {
    case thumb
    case poster
}

struct MoviesModel: Decodable {
    var results: [MovieBreifModel]
}

struct MovieBreifModel: Decodable {
    var id: Int
    var title: String
    var description: String
    var releaseDate: String
    var thumbImage: String = ""
    
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
        let path = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        self.thumbImage = "\(Constants.Media.baseURL.rawValue)\(Constants.Media.AppendingURL.thumbSize.rawValue)\(path)"
    }
    
    init(id: Int,
         title: String,
         description: String,
         releaseDate: String,
         thumbImage: String = "") {
        self.id = id
        self.title = title
        self.description = description
        self.releaseDate = releaseDate
        self.thumbImage = thumbImage
    }
    
}
