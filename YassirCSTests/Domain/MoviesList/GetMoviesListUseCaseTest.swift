//
//  GetMoviesListUseCaseTest.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import XCTest
@testable import YassirCS

class GetMoviesListUseCaseTest: XCTestCase {
    func testFetchDataSuccessCase() {
        let repository = MoviesRepository(moviesAPICalls: FakeSuccessMoviesListAPICalls())
        let useCase = GetMoviesListUseCase(repo: repository)
        useCase.execute { result in
            switch result {
            case .success(let newsList):
                XCTAssert(newsList.count == 3)
                XCTAssert(newsList.first?.title == "Harry Potter 1")
            case .failure(_):
                break
            }
        }
    }
    
    func testFetchDataFailureCAse() {
        let repository = MoviesRepository(moviesAPICalls: FakeFailureMoviesListAPICalls())
        let useCase = GetMoviesListUseCase(repo: repository)
        useCase.execute { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                XCTAssert(error.localizedDescription == Constants.NetworkCallError.wentWrong.rawValue)
            }
        }
    }

}
