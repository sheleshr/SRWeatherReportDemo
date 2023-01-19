//
//  RootViewModel.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 18/01/23.
//

import Foundation

class RootViewModel: ObservableObject{
    @Published var latitude:String = "44.34"
    @Published var longitude:String = "10.99"
    @Published var isSubmit:Bool = false
    
    let networkManager:NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    func submit(){
        
        guard let url = URL(string: APPURL.weatherUrl) else {
            return
        }
        var components = URLComponents()
        components.scheme = url.scheme
        components.host = url.host
        components.path = url.path
        components.queryItems = [
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude),
            URLQueryItem(name: "appid", value: APPURL.appID)
        ]
        
        if let _url = components.url {
            let urlReq = URLRequest(url: _url)
            self.networkManager.fetchRequest(urlReq: urlReq, modelType: Forecast.self) {[weak self] result in
                switch result {
                case .failure(let err):
                    print("\(err.localizedDescription)")
                case .success(let forecast):
                    print("\(forecast.city.name)")
                    
                    SharedData.shared.forecast = forecast
                    
                    DispatchQueue.main.async {
                        self?.isSubmit = true
                    }
                    
                }
            }
            
        }
    }
}
