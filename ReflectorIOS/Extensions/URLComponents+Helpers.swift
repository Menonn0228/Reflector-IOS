//
//  URLComponents+Helpers.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 8/27/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation


// MARK: Reflector Base

extension URLComponents {
    /// generates a template URLComponent that contains the necessary base components to reach the Reflector Online site.
    static let reflectorBaseComponents: URLComponents = {
        var urlComponent = URLComponents()
        urlComponent.scheme = "http"
        urlComponent.host = "reflector-online.com"
        urlComponent.path = "/search/"
        return urlComponent
    }()
}
