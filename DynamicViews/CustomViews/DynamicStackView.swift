//
//  DynamicStackView.swift
//  DynamicViews
//
//  Created by Alaa AlZaibak on 10.06.2020.
//  Copyright © 2020 Volt Lines. All rights reserved.
//

import UIKit

protocol AutoHidableView {
    var canHide: Bool { get }
}

@IBDesignable
class DynamicStackView: UIStackView {
    var visibleDynamicSubviewsCount: Int {
        return self.arrangedSubviews.reduce(0) { (result, subview) -> Int in
            if !subview.isHidden && canHide(subview) {
                return result + 1
            }
            return result
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        var changesNeeded = true
        while changesNeeded {
            var subviewsIntrinsicSum: CGFloat = 0
            var viewSize: CGFloat = 0
            if self.axis == .horizontal {
                subviewsIntrinsicSum = self.arrangedSubviews.reduce(0) { (result, subview) -> CGFloat in
                    !subview.isHidden ? result + subview.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).width + spacing : result
                }
                if subviewsIntrinsicSum > 0 {
                    subviewsIntrinsicSum -= spacing
                }
                viewSize = self.bounds.size.width
            }
            else {
                subviewsIntrinsicSum = self.arrangedSubviews.reduce(0) { (result, subview) -> CGFloat in
                    !subview.isHidden ? result + subview.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height + spacing : result
                }
                if subviewsIntrinsicSum > 0 {
                    subviewsIntrinsicSum -= spacing
                }
                viewSize = self.bounds.size.height
            }
            if (viewSize < subviewsIntrinsicSum) {
                if visibleDynamicSubviewsCount > 0 {
                    hideNextSubview()
                }
                else {
                    changesNeeded = false
                }
            } else {
                changesNeeded = false
            }
        }
        super.layoutSubviews()
    }
    
    func hideNextSubview() {
        for subview in self.arrangedSubviews {
            if !subview.isHidden && canHide(subview) {
                subview.isHidden = true
            }
        }
    }
    
    private func canHide(_ subview: UIView) -> Bool {
        if let dynamicSubview = subview as? AutoHidableView, dynamicSubview.canHide {
            return true
        }
        else {
            return false
        }
    }
}

