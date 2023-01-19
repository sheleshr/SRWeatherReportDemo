//
//  LazyView.swift
//  SRWeatherReportDemo
//
//  Created by Administrator on 18/01/23.
//

import SwiftUI

struct LazyView<Content:View>: View {
    let content: () -> Content
    init(content: @escaping () -> Content) {
        self.content = content
    }
    var body: Content {
        content()
    }
}

struct LazyView_Previews: PreviewProvider {
    static var previews: some View {
        LazyView {
            Text("LazyView")
        }
    }
}
