import Foundation
import Kingfisher

class KingfisherService {
    
    static let shared = { KingfisherService() }()
    
    func loadImageFrom(urlString: String,
                       success: @escaping (Data) -> (),
                       failure: @escaping (KingfisherError) -> ()) {
        
    
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        ImageDownloader.default.downloadImage(with: url, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                print("Data: \(value.originalData)")
                success(value.originalData)
            case .failure(let error):
                print("Error: \(error)")
                failure(error)
            }
        }
       
//        let resource = ImageResource(downloadURL: url)
//
//        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
//            switch result {
//            case .success(let value):
//                print("Image: \(value.image). Got from: \(value.cacheType)")
//                success(value.image)
//            case .failure(let error):
//                print("Error: \(error)")
//                failure(error)
//            }
//        }
    }
}
