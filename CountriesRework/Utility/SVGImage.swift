//
//  SVGImage.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 30.09.2022.
//

import Foundation
import SVGKit
extension UIImageView {
    
    func downloadedsvg(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let receivedicon: SVGKImage = SVGKImage(data: data),
                let image = receivedicon.uiImage
            else { return }
            DispatchQueue.main.async() {
                
                self.image = image
            }
        }.resume()
    }
}
