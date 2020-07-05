//
//  BaseNavigationBar.swift
//  Bomapp
//
//  Created by Yong Seok Kim on 2020/07/04.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class BaseNavigationBar: UINavigationBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setValue(true, forKey: "hidesShadow")
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue(true, forKey: "hidesShadow")
    }

    // MARK: Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
