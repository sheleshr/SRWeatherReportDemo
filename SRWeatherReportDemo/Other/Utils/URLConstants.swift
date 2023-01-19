//
//  Constants.swift
//  SwiftUIDemo
//
//  Created by Administrator on 05/07/22.
//

import Foundation

struct APPURL {

    private struct Domains {
        static let Dev = "https://api.openweathermap.org"
        static let UAT = "https://api.openweathermap.org"
        static let Local = "https://api.openweathermap.org"
        static let QA = "https://api.openweathermap.org"
    }

    private  struct Routes {
        static let api = "/data/2.5"
    }

    
    private  static let domain = Domains.Dev
    private  static let route = Routes.api
    private  static let baseURL = domain + route

    static let appID = "ff9f1cb5cebc2ee7df29e3381eb00832"
}
extension APPURL {
    static var weatherUrl: String {
        return baseURL  + "/forecast"
    }
}
