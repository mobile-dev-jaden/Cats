//
//  ImagesService.swift
//  Cats
//
//  Created by 김태호 on 2022/07/10.
//

import Combine
import Foundation

class ImagesService {
    private var cancellable = Set<AnyCancellable>()
    private let imagesApi = ImagesApi()
    
    func getImages(limit: Int, page: Int) -> AnyPublisher<[ImageRes], Error> {
        return Deferred {
            Future { promise in
                URLSession.shared.dataTaskPublisher(for: self.imagesApi.getAllPublicImages(limit: limit, page: page))
                    .receive(on: DispatchQueue.global(qos: .background))
                    .subscribe(on: DispatchQueue.main)
                    .map(\.data)
                    .decode(type: [ImageRes].self, decoder: JSONDecoder())
                    .sink(
                        receiveCompletion: {
                            switch($0) {
                            case .failure(let error):
                                promise(.failure(error))
                            case .finished:
                                return
                            }
                        },
                        receiveValue: {
                            promise(.success($0))
                        })
                    .store(in: &self.cancellable)
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getSingleImage() -> AnyPublisher<ImageRes, Error> {
        return Deferred {
            Future { promise in
                URLSession.shared.dataTaskPublisher(for: self.imagesApi.getSingleImage())
                    .receive(on: DispatchQueue.global(qos: .background))
                    .subscribe(on: DispatchQueue.main)
                    .map(\.data)
                    .decode(type: ImageRes.self, decoder: JSONDecoder())
                    .sink(
                        receiveCompletion: {
                            switch($0) {
                            case .failure(let error):
                                promise(.failure(error))
                            case .finished:
                                return
                            }
                        },
                        receiveValue: {
                            promise(.success($0))
                        })
                    .store(in: &self.cancellable)
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    func getImage(id imageId: String) -> AnyPublisher<ImageRes, Error> {
        return Deferred {
            Future { promise in
                URLSession.shared.dataTaskPublisher(for: self.imagesApi.getImage(by: imageId))
                    .receive(on: DispatchQueue.global(qos: .background))
                    .subscribe(on: DispatchQueue.main)
                    .map(\.data)
                    .decode(type: ImageRes.self, decoder: JSONDecoder())
                    .sink(
                        receiveCompletion: {
                            switch($0) {
                            case .failure(let error):
                                promise(.failure(error))
                            case .finished:
                                return
                            }
                        },
                        receiveValue: {
                            promise(.success($0))
                        })
                    .store(in: &self.cancellable)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /** MARK: - The Following API keeps occuring fowllowing error.
     *  `parser error, xxx of 207 bytes parsed`
     * Not sure if this is about URLSession Configuration related or
     * Server side data size limitation.
     * Waiting for the answer from 2022.07.23 15:00 ~
     */
    func getImageUploaded(image: Data) { }
}
