//
//  TabItems.swift
//  CustomTabItem
//
//  Created by AJ-CHARA WAROROS on 2/6/2564 BE.
//

import UIKit

enum TabItems: Int {
  case home = 0
  case explore = 1
  case order = 2
  case notification = 3
  case settings = 4
  
  
  var viewController: UIViewController {
    switch self {
    case .home:
      return UIStoryboard.init(name: "Landing", bundle: Bundle.main).instantiateViewController(withIdentifier: "Landing")
    case .explore:
      return UIStoryboard.init(name: "Explore", bundle: Bundle.main).instantiateViewController(withIdentifier: "Explore")
    case .order:
      return UIStoryboard.init(name: "Order", bundle: Bundle.main).instantiateViewController(withIdentifier: "Order")
    case .notification:
      return UIStoryboard.init(name: "Notification", bundle: Bundle.main).instantiateViewController(withIdentifier: "Notification")
    case .settings:
      return UIStoryboard.init(name: "Setting", bundle: Bundle.main).instantiateViewController(withIdentifier: "Setting")
    }
  }
  
  var title: String {
    switch self {
    case .home:
      return "Home"
    case .explore:
      return "Explore"
    case .order:
      return "Order"
    case .notification:
      return "Notification"
    case .settings:
      return "Setting"
    }
  }
  
  var image: UIImage {
    switch self {
    case .home:
      return UIImage(asset: Asset.TabBar.icHome)
    case .explore:
      return UIImage(asset: Asset.TabBar.icSummary)
    case .order:
      return UIImage(asset: Asset.TabBar.icMoneyOut)
    case .notification:
      return UIImage(asset: Asset.TabBar.icNotification)
    case .settings:
      return UIImage(asset: Asset.TabBar.icSettings)
    }
  }
  
  var imageSelected: UIImage {
    switch self {
    case .home:
      return UIImage(asset: Asset.TabBar.icHomeOn)
    case .explore:
      return UIImage(asset: Asset.TabBar.icSummaryOn)
    case .order:
      return UIImage(asset: Asset.TabBar.icMoneyOutOn)
    case .notification:
      return UIImage(asset: Asset.TabBar.icNotificationOn)
    case .settings:
      return UIImage(asset: Asset.TabBar.icSettingsOn)
    }
  }
}

internal enum Asset {
  internal enum TabBar {
    public static let icHome = ImageAsset(name: "ic_home")
    public static let icHomeOn = ImageAsset(name: "ic_home_on")
    public static let icMic = ImageAsset(name: "ic_mic")
    public static let icMoneyOut = ImageAsset(name: "ic_money_out")
    public static let icMoneyOutOn = ImageAsset(name: "ic_money_out_on")
    public static let icNotification = ImageAsset(name: "ic_notification")
    public static let icNotificationOn = ImageAsset(name: "ic_notification_on")
    public static let icSettings = ImageAsset(name: "ic_settings")
    public static let icSettingsOn = ImageAsset(name: "ic_settings_on")
    public static let icSummary = ImageAsset(name: "ic_summary")
    public static let icSummaryOn = ImageAsset(name: "ic_summary_on")
  }
}
