//
//   MockURLProtocol.swift
//  PhotoAppTestingPracticeTests
//
//  Created by bartek on 04/12/2023.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var error: Error?
    static var stubResponseData: Data?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func startLoading() {
        
        if let signupError = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: signupError)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() { }
}
