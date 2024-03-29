//
//  BaseViewFrame.swift
//  Cats
//
//  Created by 김태호 on 2022/07/13.
//

import SwiftUI

struct BaseViewFrame<Content: View>: View {
    typealias ViewHandler = () -> Content
    
    private var viewTitle: String?
    private var middle: Content
    
    init(
        viewTitle: String? = nil,
        @ViewBuilder middle: ViewHandler
    ) {
        self.viewTitle = viewTitle
        self.middle = middle()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if let viewTitle = viewTitle {
                getNavigationTitle(viewTitle)
            }
            Spacer(minLength: 0)
            middle
            Spacer(minLength: 0)
        }
        .ignoresSafeArea()
    }
    
    private func getNavigationTitle(_ title: String) -> some View {
        ZStack {
            Color.accentColor
            HStack {
                Text(title)
                    .font(.title)
                    .bold()
                Spacer()
            }
            .offset(x: 0, y: 15)
            .padding()
        }
        .frame(height: 120)
        .opacity(0.7)
    }
}

struct BaseViewFrame_Previews: PreviewProvider {
    @State static var tab = TabBarItems.home
    
    static var previews: some View {
        Group {
            BaseViewFrame(
                viewTitle: "View Title",
                middle: {
                    VStack {
                        Color.blue
                    }
                })
            BaseViewFrame(
                middle: {
                    VStack {
                        Color.blue
                    }
                })
        }
    }
}
