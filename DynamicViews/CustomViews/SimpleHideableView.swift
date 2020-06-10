//
//  SimpleHideableView.swift
//  DynamicViews
//
//  Created by Alaa AlZaibak on 10.06.2020.
//  Copyright © 2020 Volt Lines. All rights reserved.
//

import UIKit

@IBDesignable
public class SimpleHideableView: UIView, AutoHidableView {
    @IBInspectable
    public var canHide: Bool = false {
        didSet { setNeedsDisplay() }
    }
}
