//
//  SimpleCompressibleView.swift
//  DynamicViews
//
//  Created by Alaa AlZaibak on 10.06.2020.
//  Copyright © 2020 Volt Lines. All rights reserved.
//

import UIKit

public class SimpleCompressibleView: UIView, AutoCompressibleView {
    private var isCompressed = false
    
    public let canCompress: Bool = true
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var extendedView: UIView!
    @IBOutlet var compressedView: UIView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeSubviews()
    }
    
    private func initializeSubviews() {
        Bundle.main.loadNibNamed("SimpleCompressibleView", owner: self, options: nil)
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let verticalConstraint = containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let widthConstraint = containerView.topAnchor.constraint(equalTo: self.topAnchor)
        let heightConstraint = containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

        compressedView.isHidden = true
        extendedView.isHidden = false
    }
    
    public func compress() {
        guard !isCompressed else {
            return
        }
        compressedView.isHidden = false
        extendedView.isHidden = true
        isCompressed = true
    }
    
    @IBAction func compressedButtonDidTap(_ sender: UIButton) {
        print("compressedButtonDidTap")
    }

    @IBAction func extendedButton1DidTap(_ sender: UIButton) {
        print("extendedButton1DidTap")
    }

    @IBAction func extendedButton2DidTap(_ sender: UIButton) {
        print("extendedButton2DidTap")
    }
}
