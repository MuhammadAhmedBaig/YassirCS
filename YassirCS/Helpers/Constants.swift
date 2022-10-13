//
//  Constants.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

enum Constants {
    enum API: String {
        case baseURL = "https://api.themoviedb.org/3/"
        case key = "c9856d0cb57c3f14bf75bdc6c063b8f3"
        enum QueryParam: String {
            case apiKeyParam = "api_key"
        }
        enum EndPoints: String {
            case discoverMovies = "discover/movie"
            case details = "/movie/"
        }
    }
    
    enum Media: String {
        case baseURL = "https://image.tmdb.org/t/p/"
        enum AppendingURL: String {
            case originalSize = "original"
            case thumbSize = "w300"
        }
    }
    
    enum NetworkCallError: String {
        case wentWrong = "Something went wrong, please try again later."
        case parsingError = "Unable to parse data."
    }
    
    enum Error: String {
        case invalidURL = "URL seems to be not correct."
    }
    
    enum ScreenTitle: String {
        case homeTitle = "Trending Movies"
        case detailsTitle = "Movie Details"
    }
}
