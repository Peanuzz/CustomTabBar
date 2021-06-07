//
//  TabBarViewController.swift
//  CustomTabItem
//
//  Created by AJ-CHARA WAROROS on 27/5/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
  
  var customTabBar: CustomTabBar!
  
  enum Constants {
    static let barHeight: CGFloat = 60.0
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("TabBarViewController - viewDidLoad")
    self.loadTabBar()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tabBar.frame.size.height = Constants.barHeight
    tabBar.frame.origin.y = view.frame.height - Constants.barHeight
  }
  
  func loadTabBar() {
    let tabItems: [TabItems] = [.home, .explore, .order, .notification, .settings]
    setupCustomTabBar(tabItems) { (controllers) in
      self.viewControllers = controllers
    }
    selectedIndex = 0
  }
  
  func setupCustomTabBar(_ items: [TabItems], completion: @escaping ([UIViewController]) -> Void) {
    // handle creation of the tab bar and attach touch event listeners
    let frame = tabBar.frame
    var controllers = [UIViewController]()
    // hide the tab bar
    tabBar.isHidden = true
    customTabBar = CustomTabBar.loadNib()
    customTabBar.frame = frame
    customTabBar.setupTabs(tabBarItems: items)
    customTabBar.translatesAutoresizingMaskIntoConstraints = false
    customTabBar.clipsToBounds = true
    customTabBar.itemTapped = changeTab
    customTabBar.tabBarController = self
    view.addSubview(customTabBar)
    // Add positioning constraints to place the nav menu right where the tab bar should be
    let safeArae = view.safeAreaLayoutGuide
    NSLayoutConstraint.activate([
      customTabBar.leadingAnchor.constraint(equalTo: safeArae.leadingAnchor),
      customTabBar.trailingAnchor.constraint(equalTo: safeArae.trailingAnchor),
      customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
      customTabBar.heightAnchor.constraint(equalToConstant: Constants.barHeight),
      customTabBar.bottomAnchor.constraint(equalTo: safeArae.bottomAnchor)
    ])

    for item in items {
      controllers.append(item.viewController)
    }

    self.view.layoutIfNeeded()
    completion(controllers)
  }
  
  func changeTab(tab: Int) {
    selectedIndex = tab
  }
}
