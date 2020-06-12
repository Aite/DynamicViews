//
//  SimpleCompressibleLabel.swift
//  DynamicViews
//
//  Created by Alaa AlZaibak on 12.06.2020.
//  Copyright © 2020 Volt Lines. All rights reserved.
//

import UIKit

@IBDesignable
class SimpleCompressibleLabel: UILabel, AutoCompressibleView {
    @IBInspectable
    var canCompress: Bool = false
    
    func compress() {
        if canCompress {
            self.numberOfLines = 1
        }
    }
    

}
