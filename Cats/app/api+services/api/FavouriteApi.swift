//
//  FavouriteApi.swift
//  Cats
//
//  Created by 김태호 on 2022/07/10.
//

import Foundation

struct FavouriteApi {
    /**
     * Get the Favourites belonging to your account, with the
     * option to filter by ‘sub_id’ used when creating them.
     */
    func getMyFavourites() -> URLRequest {
        return RequestBuilder()
            .setPath(path: "/favourites")
            .setMethod(method: .get)
            .build()
    }
    
    /**
     * Get one specific Favourite belonging to your Account
     */
    func getMyFavourites(favourite id: String) -> URLRequest {
        return RequestBuilder()
            .setPath(path: "/favourites/\(id)")
            .setMethod(method: .get)
            .build()
    }
    
    /**
     * Get one specific Favourite belonging to your Account
     */
    func deleteFavourite(favourite id: String) -> URLRequest {
        return RequestBuilder()
            .setPath(path: "/favourites/\(id)")
            .setMethod(method: .delete)
            .build()
    }
    
    /**
     * Save an Image as a Favourite to your Account by sending the ‘image_id’ in the body.
     * An optional ‘sub_id’ can be passed to help filter Favourites when performing GET /favourites
     */
    func saveFavouriteImage(imageId id: String) -> URLRequest {
        let header = [
            "Content-Type": "application/json",
        ]
        let req = SaveFavouriteImageRequest(imageId: id)
        
        return RequestBuilder()
            .setPath(path: "/favourites")
            .setHeaders(headers: header)
            .setParameters(parameters: req.getJson())
            .setMethod(method: .post)
            .build()
    }
}
