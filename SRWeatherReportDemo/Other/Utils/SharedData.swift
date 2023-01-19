//
//  SharedData.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 18/01/23.
//

import Foundation

class SharedData {
    static var shared = SharedData()
    
    var forecast:Forecast?
    
    
    private init(){
    }
    
}
