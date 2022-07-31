//
//  SaveFavouriteImageRequest.swift
//  Cats
//
//  Created by 김태호 on 2022/07/31.
//

import Foundation

struct SaveFavouriteImageRequest: Codable {
    let imageId: String
    let subId: String
    
    init(
        imageId: String,
        subId: String = UserInfoCache.shared.id
    ) {
        self.imageId = imageId
        self.subId = subId
    }
    
    enum CodingKeys: String, CodingKey {
        case imageId = "image_id"
        case subId = "sub_id"
    }
    
    func getJson() -> Data {
        guard let data = try? JSONEncoder().encode(self) else {
            return Data()
        }
        
        let string = String(data: data, encoding: .utf8)
        print(string ?? "")
        
        return data
    }
}
