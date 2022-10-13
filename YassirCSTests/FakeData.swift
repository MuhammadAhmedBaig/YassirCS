//
//  FakeData..swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation
@testable import YassirCS

struct FakeData {
    struct FakeListData {
        static func makeFakeSuccessData() -> MoviesModel {
            let movies = [MovieBreifModel(id: 1,
                                    title: "Harry Potter 1",
                                    description: "Harry Potter is a film series based on the eponymous novels by J. K. Rowling.",
                                    releaseDate: "2022-06-24",
                                    thumbImage: "https://tinyurl.com/2w3jezr9"),
                            MovieBreifModel(id: 2,
                                            title: "Harry Potter 2",
                                            description: "The series is produced and distributed by Warner Bros.",
                                            releaseDate: "2022-06-24",
                                            thumbImage: "https://tinyurl.com/2w3jezr9"),
                            MovieBreifModel(id: 3,
                                            title: "Harry Potter 3",
                                            description: "Pictures and consists of eight fantasy films, beginning with Harry Potter and the Philosopher's Stone and culminating with Harry Potter and the Deathly Hallows – Part 2",
                                            releaseDate: "2022-06-24",
                                            thumbImage: "https://tinyurl.com/2w3jezr9")]
            return MoviesModel(results: movies)
        }
    }
    
    struct FakeDetailsData {
        static func makeFakeSuccessData() -> MovieDetailsModel {
            return MovieDetailsModel(id: 1,
                                     title: "Harry Potter",
                                     description: "Harry Potter is a film series based on the eponymous novels by J. K. Rowling.",
                                     releaseDate: "2022-06-24",
                                     homepageLink: "https://www.imdb.com/title/tt0241527/",
                                     posterImage: "https://tinyurl.com/2w3jezr9")
        }
    }


    static func makeFakeFailureData() -> YCSError {
        return YCSError(message: Constants.NetworkCallError.wentWrong.rawValue)
    }
}
