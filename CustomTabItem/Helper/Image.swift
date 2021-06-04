//
//  Image.swift
//  CustomTabItem
//
//  Created by AJ-CHARA WAROROS on 28/5/2564 BE.
//

import UIKit

public typealias AssetType = ImageAsset

public struct ImageAsset {
  public fileprivate(set) var name: String

  public var image: Image {
    #if os(iOS)
    let bundle = Bundle.main
    #else
    let bundle = Bundle(for: BundleToken.self)
    #endif
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}


public typealias Image = UIImage

public extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS)
    let bundle = Bundle.main
    #elseif os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    #endif
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}
