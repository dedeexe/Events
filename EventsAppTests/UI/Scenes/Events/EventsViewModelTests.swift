//
//  EventsViewModelTests.swift
//  EventsAppTests
//
//  Created by User on 10/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest
import SwiftUI
import Combine
import Foundation
@testable import EventsApp

class EventsViewModelTests: XCTestCase {
    
    var adapter: MockedAdapter!
    var sut: EventsViewModel!
    
    var cancellables: Set<AnyCancellable> = []

    func testDataStateSuccess() throws {
        adapter = MockedAdapter(isFail: false)
        sut = EventsViewModel(adapter: adapter)
        var calls = 0
        
        let expectation = XCTestExpectation()
                
        sut.$state.sink { dataState in
            switch dataState {
            case .loaded(let events):
                let event = events.first!.event
                XCTAssertEqual(events.count, 1)
                XCTAssertEqual(event.title, "title")
                XCTAssertEqual(event.date, "01/01/2020")
                XCTAssertEqual(event.description, "description")
                XCTAssertEqual(event.image, "image")
                XCTAssertEqual(event.latitude, 0)
                XCTAssertEqual(event.longitude, 0)
                XCTAssertEqual(event.people.count, 0)
                XCTAssertEqual(event.price, "price")
                XCTAssertEqual(calls, 2)
                expectation.fulfill()
            case .idle:
                XCTAssertEqual(calls, 0)
                calls += 1
            case .loading:
                XCTAssertEqual(calls, 1)
                calls += 1
            default:
                XCTFail("The expected state was .loaded and received \(dataState)")
            }
        }
        .store(in: &cancellables)
        
        sut.getEvents()
        wait(for: [expectation], timeout: 5)
    }
    
    func testDataInitialStateIdle() throws {
        adapter = MockedAdapter(isFail: false)
        sut = EventsViewModel(adapter: adapter)
        
        let expectation = XCTestExpectation()
                
        sut.$state.sink { dataState in
            switch dataState {
            case .idle:
                expectation.fulfill()
            default:
                XCTFail("The expected state was .idle and received \(dataState)")
            }
        }
        .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testDataStateError() throws {
        adapter = MockedAdapter(isFail: true)
        sut = EventsViewModel(adapter: adapter)
        
        let expectation = XCTestExpectation()
        var calls = 0
                
        sut.$state.sink { dataState in
            switch dataState {
            case .error(let error as NSError):
                XCTAssertEqual(error.domain, "Error")
                XCTAssertEqual(error.code, 1000)
                XCTAssertEqual(dataState.errorMessage ?? "", "The operation couldn’t be completed. (Error error 1000.)")
                expectation.fulfill()
            case .idle:
                XCTAssertEqual(calls, 0)
                calls += 1
            case .loading:
                XCTAssertEqual(calls, 1)
                calls += 1
            default:
                XCTFail("The expected state was .error and received \(dataState)")
            }
        }
        .store(in: &cancellables)
        
        sut.getEvents()
        wait(for: [expectation], timeout: 5)
    }

    func testViewModelSelection() throws {
        sut = EventsViewModel()
        
        let expectation = XCTestExpectation()
        var count = 0
                
        sut.$selectedDetailViewModel.sink { viewModel in
            if count == 1 {
                XCTAssertNotNil(viewModel)
                XCTAssertEqual(viewModel!.event, createMockedEvent())
                XCTAssertEqual(count, 1)
                expectation.fulfill()
                
            } else if count > 1 {
                XCTFail("This publisher was called more than twice")
            }
            
            count += 1
        }
        .store(in: &cancellables)
        
        sut.selectDetailViewModel(from: createMockedEventDetailViewModel())
        wait(for: [expectation], timeout: 5)
    }
    
    
}

//MARK: - Mocks

class MockedAdapter: EventsAdapter {
    let isFail: Bool
    
    init(isFail: Bool) {
        self.isFail = isFail
    }
    
    func allEvents() -> AnyPublisher<[Event], Error> {
        if isFail {
            return allEventsError()
        }
        return allEventsSuccess()
    }
    
    private func allEventsSuccess() -> AnyPublisher<[Event], Error> {
        let event = createMockedEvent()
        return Future<[Event], Error> { promise in promise(.success([event])) }
            .eraseToAnyPublisher()
    }
    
    private func allEventsError() -> AnyPublisher<[Event], Error> {
        let error = NSError(domain: "Error", code: 1000, userInfo: nil)
        
        return Future<[Event], Error> { promise in promise(.failure(error)) }
            .eraseToAnyPublisher()
    }
}


// MARK: - Helpers

func createMockedEvent() -> Event {
    Event(
        id: "1",
        people: [],
        date: "01/01/2020",
        description: "description",
        image: "image",
        longitude: 0,
        latitude: 0,
        price: "price",
        title: "title"
    )
}

func createMockedEventDetailViewModel() -> EventCardViewModel {
    EventCardViewModel(event: createMockedEvent())
}
