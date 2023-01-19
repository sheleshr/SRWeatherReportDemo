//
//  DayViewModel.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 18/01/23.
//

import Foundation

class DayViewModel : ObservableObject{
    var list:[String] {
           
        let ar:[String]? = SharedData.shared.forecast?.list
            .map{obj in
                let strDate = obj.dtTxt
                let dtFormatter = DateFormatter()
                dtFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let dt = dtFormatter.date(from: strDate)
                dtFormatter.dateFormat = "yyyy-MM-dd"
                return dtFormatter.string(from: dt!)
        }
        .compactMap{$0}

        if let arr = ar {
         let uniqueAr = Array(NSOrderedSet(array: arr)) as! [String]
        return uniqueAr
        }
        return [String]()
    }
    
}


