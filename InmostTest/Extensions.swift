//
//  Extensions.swift
//  InmostTest
//
//  Created by alex-babich on 08.09.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImge(withUrl url: URL) {
       DispatchQueue.global().async { [weak self] in
           if let imageData = try? Data(contentsOf: url) {
               if let image = UIImage(data: imageData) {
                   DispatchQueue.main.async {
                       self?.image = image
                   }
               }
           }
       }
   }
}
