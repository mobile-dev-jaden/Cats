//
//  SettingsView.swift
//  Cats
//
//  Created by 김태호 on 2022/07/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject private var vm = SettingsViewModel()
    
    
    var body: some View {
        Form {
            Section(
                content: {
                    HStack(alignment: .top) {
                        VStack(spacing: 5) {
                            Image("cat-paw")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding()
                                .background(
                                    Color.black
                                        .cornerRadius(10)
                                )
                            Text("User-name")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(5)
                                .background(
                                    Color.accentColor
                                        .cornerRadius(5)
                                        .opacity(0.8)
                                )
                        }
                        VStack(alignment: .leading) {
                            Text("User ID")
                                .font(.headline)
                                .foregroundColor(.accentColor)
                                .padding(.vertical, 5)
                            Text(vm.getUserId()).font(.callout)
                            
                        }.padding(.leading)
                    }
                },
                header: {
                    Text("User Information")
                })
            
            Section(
                content: {
                    // TODO: Make stepper
                },
                header: {
                    Text("Number of Cat Pictures per Page")
                })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
