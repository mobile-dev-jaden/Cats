//
//  FavouriteView.swift
//  Cats
//
//  Created by 김태호 on 2022/07/10.
//

import SwiftUI

struct FavouriteView: View {
    @ObservedObject var vm = FavouriteViewModel()
    
    var body: some View {
        ScrollView {
            Text("My Favourite Cats")
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
