//
//  CustomTabBar.swift
//  CustomTabItem
//
//  Created by AJ-CHARA WAROROS on 1/6/2564 BE.
//

import UIKit

class CustomTabBar: UIView {
  
  @IBOutlet weak var bottomStack: UIStackView!
  
  var itemTapped: ((_ tab: Int) -> Void)?
  var activeItem: Int = 0
  var deActiveItem: Int = 0
  
  func setupTabs(tabBarItems: [TabItems]) {
    for (index, model) in tabBarItems.enumerated() {
      var item = BottomStackItem(
        title: model.title,
        image: model.image,
        selected: model.imageSelected
      )
      item.isSelected = index == 0
      let view = StackItemView.newInstance
      view.item = item
      view.tag = index
      view.delegate = self
      bottomStack.addArrangedSubview(view)
    }
    activateTab(tab: 0)
  }
  
  func switchTab(from: Int, to: Int) {
    deactivateTab(tab: from)
    activateTab(tab: to)
  }
  
  func activateTab(tab: Int) {
    itemTapped?(tab)
    activeItem = tab
    updateSelectedTab(index: tab, isSelected: true)
  }
  
  func deactivateTab(tab: Int) {
    itemTapped?(tab)
    deActiveItem = tab
    updateSelectedTab(index: tab, isSelected: false)
  }
  
  private func updateSelectedTab(index: Int, isSelected: Bool) {
    let itemView = bottomStack.arrangedSubviews[index] as? StackItemView
    itemView?.isSelected = isSelected
  }
}

extension CustomTabBar: StackItemViewDelegate {
  func handleTapSelected(_ view: StackItemView) {
    itemTapped?(view.tag)
    switchTab(from: activeItem, to: view.tag)
  }
}
