//
//  UIViewController+Extension.swift
//  UnipTest
//
//  Created by Pavel Privalov on 13.04.2020.
//  Copyright © 2020 Павел Привалов. All rights reserved.
//

import UIKit

extension UIViewController {
    class func instantiateFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper()
    }
    
    private class func instantiateFromStoryboardHelper<T>() -> T {
        let storyboardName = String(describing: self)
        return UIStoryboard(name: storyboardName,
                            bundle: nil).instantiateInitialViewController() as! T
    }
}
