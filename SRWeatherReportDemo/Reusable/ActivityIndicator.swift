//
//  ActivityIndicator.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 03/02/23.
//

import Foundation
import SwiftUI
struct ActivityIndicator:UIViewRepresentable{
    
    typealias UIViewType = UIActivityIndicatorView
    var isAnimating:Bool
    var style:UIActivityIndicatorView.Style
    var color:UIColor
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activity = UIActivityIndicatorView(style: style)
        activity.color = color
        return activity
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating == true{
            uiView.startAnimating()
        }
        else
        {
            uiView.stopAnimating()
        }
    }
    
}
