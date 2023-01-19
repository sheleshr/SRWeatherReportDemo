//
//  DayView.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 18/01/23.
//

import SwiftUI

struct DayView: View {
    let vm:DayViewModel
    
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
            
            SwiftUI.List(vm.list.indices, id: \.self) { idx in
                
                    row(title: "Day\(idx+1)", subtitle: vm.list[idx])
                }
            }
        
        .navigationTitle(Text("Day View"))
    }
    
    func row(title:String, subtitle:String)-> some View{
        NavigationLink {
            LazyView{WeatherReportView(vm:WeatherReportViewModel(strDate:subtitle))}
        } label: {
            HStack{
                Spacer().frame(width:10)
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Spacer()
                Text(subtitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
            }
        }



    }
    
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(vm: DayViewModel())
    }
}
