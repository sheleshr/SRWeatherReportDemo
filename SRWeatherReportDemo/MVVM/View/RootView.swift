//
//  RootView.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 18/01/23.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var vm:RootViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment:.top){
                Color.gray.opacity(0.2)
                    .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
                VStack{
                    keyWithTextField1(key: "Latitude", placeholder: "44.34")
                    keyWithTextField2(key: "Longitude", placeholder: "10.99")
                    submit
                }
            }
            .navigationDestination(isPresented: $vm.isSubmit, destination: {
                LazyView {
                    DayView(vm: DayViewModel())
                }
            })
            .navigationTitle(Text("Weather Report"))
        }
    }
    func keyWithTextField1(key:String, placeholder:String) -> some View{
        VStack(alignment: .leading){
            Text(key)
            TextField(placeholder, text: $vm.latitude)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
    func keyWithTextField2(key:String, placeholder:String) -> some View{
        VStack(alignment: .leading){
            Text(key)
            TextField(placeholder, text: $vm.longitude)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
    var submit: some View{
        Button {
            vm.submit()
        } label: {
            Text("Submit")
                .frame(width: 200, height: 50)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .background(Color.blue)
        .cornerRadius(15)

    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(vm: RootViewModel())
    }
}
