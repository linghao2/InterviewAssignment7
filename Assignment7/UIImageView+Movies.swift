//
//  UIImageView.swift
//  Assignment7
//
//  Created by LING HAO on 2/12/18.
//  Copyright © 2018 LING HAO. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {

    func setImageWith(_ urlPath: String) {
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: urlPath as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        if let url = URL(string: urlPath) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (dataOrNil, responseOrNil, errorOrNil) in
                if errorOrNil != nil {
                    print("(error)")
                    return
                }
                DispatchQueue.main.async {
                    if let data = dataOrNil, let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: urlPath as NSString)
                        self.image = image
                    }
                }
            })
            task.resume()
        }
    }
}
