//
//  SRWeatherReportDemoApp.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 18/01/23.
//

import SwiftUI

@main
struct SRWeatherReportDemoApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(vm: RootViewModel())
        }
    }
}
