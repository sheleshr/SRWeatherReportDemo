//
//  WeatherReportViewModel.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 19/01/23.
//

import Foundation
import SwiftUI

class WeatherReportViewModel:ObservableObject{
    let strDate:String
    init(strDate: String) {
        self.strDate = strDate
    }
    
    var requiredList:[List]{
        
      let a = SharedData.shared.forecast?.list
            .map{obj in
                let _strDate = obj.dtTxt
                let dtFormatter = DateFormatter()
                dtFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let dt = dtFormatter.date(from: _strDate)
                dtFormatter.dateFormat = "yyyy-MM-dd"
                
                return (dtFormatter.string(from: dt!) == self.strDate) ? obj : nil
        }
        .compactMap{$0} as! [List]
        
        print(a)
        
        return a
    }
    func timeOf(page:Int)-> String?{
        let obj = requiredList[page]
        let _strDate = obj.dtTxt
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dt = dtFormatter.date(from: _strDate)
        dtFormatter.dateFormat = "hh:mm:ss a"
        return dtFormatter.string(from: dt!)
    }
}
