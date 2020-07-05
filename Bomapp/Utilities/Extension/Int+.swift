//
//  Int+.swift
//  Bomapp
//
//  Created by Yong Seok Kim on 2020/07/04.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
