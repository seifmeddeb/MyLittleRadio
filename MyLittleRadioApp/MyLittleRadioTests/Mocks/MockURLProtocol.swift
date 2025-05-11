// Copyright © Radio France. All rights reserved.

import Foundation

final class MockURLProtocol: URLProtocol {
    static var stubResponseData: Data?
    static var stubError: Error?

    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        if let error = Self.stubError {
            self.client?.urlProtocol(self, didFailWithError: error)
        } else if let data = Self.stubResponseData {
            self.client?.urlProtocol(self, didLoad: data)
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }

        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
