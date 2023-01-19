//
//  WeatherReportView.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 19/01/23.
//

import SwiftUI

struct WeatherReportView: View {
    @StateObject var vm:WeatherReportViewModel
    @State var showGuide:Bool = true
    
    var body: some View {
        
        ZStack{
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(0 ..< vm.requiredList.count, id: \.self) { i in
                        weatherView(idx: i)
                    }
                }
            }
            
            if showGuide {
                Image("scrollToRight")
            }
        }
        .navigationTitle(Text(vm.strDate))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.showGuide.toggle()
                        }
                    }
    }
    
    func weatherView(idx:Int) -> some View{
        let nav = 180.0
        
        return ZStack{
            ((idx%2==0) ? Color.gray.opacity(0.2) : Color.gray.opacity(0.1))
                    .edgesIgnoringSafeArea([.leading, .trailing])
                    .frame(width: UIScreen.width, height: UIScreen.height - nav)

            VStack{
                Group{
                    Spacer().frame(height:10)
                    HStack{
                        Text("WEATHER AT:\(vm.timeOf(page: idx) ?? "---")").fontWeight(.bold).foregroundColor(.secondary).font(Font.title2)
                        Spacer()
                    }
                    Divider()
                    HStack{
                        Text("TEMPRATURE:").fontWeight(.bold).foregroundColor(.secondary).font(Font.title2)
                        Spacer()
                    }
                    HStack{
                        tempView(title: "min temp.", subTitle: "\(vm.requiredList[idx].main.tempMin)")
                        Spacer()
                        tempView(title: "current temp.", subTitle: "\(vm.requiredList[idx].main.temp)")
                        Spacer()
                        tempView(title: "max temp.", subTitle: "\(vm.requiredList[idx].main.tempMax)")
                    }.padding(.all, 10)
                    Divider()
                    
                    HStack{
                        Text("WEATHER:").fontWeight(.bold).foregroundColor(.secondary).font(Font.title2)
                        Spacer()
                    }
                    VStack{
                        ForEach(0 ..< vm.requiredList[idx].weather.count, id: \.self) { i in
                            HStack{
                                Text("\(vm.requiredList[idx].weather[i].description)")
                                Spacer()
                            }
                            
                        }
                    }
                }
                Group{
                    Divider()
                    HStack{
                        Text("CLOUDS:").fontWeight(.bold).foregroundColor(.secondary).font(Font.title2)
                        Spacer()
                    }
                    HStack{
                        Text("All:")
                        Text("\(vm.requiredList[idx].clouds.all)")
                        Spacer()
                    }
                    Divider()
                    HStack{
                        Text("WIND:").fontWeight(.bold).foregroundColor(.secondary).font(Font.title2)
                        Spacer()
                    }
                    HStack{
                        tempView(title: "speed", subTitle: "\(vm.requiredList[idx].wind.speed)")
                        Spacer()
                        tempView(title: "degree", subTitle: "\(vm.requiredList[idx].wind.deg)")
                        Spacer()
                        tempView(title: "gust", subTitle: "\(vm.requiredList[idx].wind.gust)")
                    }.padding(.all, 10)
                    Divider()
                }
                
                Spacer()
            }
            .padding(.leading, 10)
            .frame(width: UIScreen.width , height: UIScreen.height - nav)
            
            

        }
        .edgesIgnoringSafeArea([.leading, .trailing])
    }
    
    func tempView(title:String, subTitle:String) -> some View{
        VStack{
            Text(title).fontWeight(.bold).foregroundColor(.gray)
            Text(subTitle).fontWeight(.medium).foregroundColor(.secondary)
        }
    }
}

struct WeatherReportView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherReportView(vm: WeatherReportViewModel(strDate: ""))
    }
}



struct WeatherViewPageSize: ViewModifier {
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
