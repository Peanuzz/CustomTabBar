//
//  Nib.swift
//
//  Created by AJ-CHARA WAROROS on 27/5/2564 BE.
//

import UIKit

// MARK: - Nib Loading

public protocol NibLoadableView: class {
  static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
  static var nibName: String {
    return String(describing: self)
  }
}

public extension NibLoadableView {
  static private func bundle() -> Bundle {
    let bundle = Bundle(for: Self.self)
    return bundle
  }

  static fileprivate func nib() -> UINib {
    let nibName = Self.nibName
    let nib = UINib(nibName: nibName, bundle: bundle())
    return nib
  }
    
  static func loadNib() -> Self {
    let classes = nib().instantiate(withOwner: nil, options: nil)
    return classes.first as! Self
  }
  
  static func instanceFromNib() -> UIView {
    return nib().instantiate(withOwner: self, options: nil).first as! UIView
  }
}

extension UIView: NibLoadableView { }
