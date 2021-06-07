//
//  BottomStackItem.swift
//  CustomTabItem
//
//  Created by AJ-CHARA WAROROS on 27/5/2564 BE.
//

import UIKit

public struct BottomStackItem {
  var title: String
  var image: UIImage
  var selected: UIImage
  var isSelected: Bool
  
  init(title: String,
       image: UIImage,
       selected: UIImage,
       isSelected: Bool = false) {
    self.title = title
    self.image = image
    self.selected = selected
    self.isSelected = isSelected
  }
}

protocol StackItemViewDelegate: class {
  func handleTapSelected(_ view: StackItemView)
  func handleDoubleTapSelected(_ view: StackItemView)
}

class StackItemView: UIView {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imgButton: UIButton!
  @IBOutlet weak var highlightView: UIView!
  @IBOutlet weak var indicatorView: UIView!
  
  weak var delegate: StackItemViewDelegate?
  
  static var newInstance: StackItemView {
    return StackItemView.loadNib()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    addTapGesture()
    addDoubleTapGesture()
    setupIndicator()
  }
  
  var isSelected: Bool = false {
    willSet {
      updateUI(isSelected: newValue)
    }
  }
  
  var item: Any? {
    didSet {
      configure(item)
    }
  }
  
  private func setupIndicator() {
    indicatorView.backgroundColor = UIColor.purple
    indicatorView.frame.size = CGSize(width: 8, height: 8)
    indicatorView.layer.cornerRadius = indicatorView.bounds.height / 2
  }
  
  private func configure(_ item: Any?) {
    guard let model = item as? BottomStackItem else { return }
    titleLabel.text = model.title
    imgButton.setImage(model.image, for: .normal)
    imgButton.setImage(model.selected, for: .selected)
    isSelected = model.isSelected
  }
  
  func selectItem(at index: Int, isSelected: Bool) {
  }
  
  private func updateUI(isSelected: Bool) {
    let options: UIView.AnimationOptions = isSelected ? [.curveEaseIn] : [.curveEaseOut]
    
    if isSelected {
      UIView.animate(withDuration: 0.3,
                     delay: 0.0,
                     usingSpringWithDamping: 1.0,
                     initialSpringVelocity: 0.5,
                     options: options,
                     animations: {
                      self.titleLabel.isHidden = true
                      self.imgButton.isSelected = true
                      self.indicatorView.isHidden = false
                      (self.superview as? UIStackView)?.layoutIfNeeded()
                     }, completion: nil)
    } else {
      titleLabel.isHidden = false
      titleLabel.textColor = UIColor.lightGray
      imgButton.isSelected = false
      indicatorView.isHidden = true
    }
  }
}

extension StackItemView {
  func addTapGesture() {
    let tapGesture = UITapGestureRecognizer(target: self,
                                            action: #selector(handleTapSelected(_:)))
    addGestureRecognizer(tapGesture)
  }
  
  func addDoubleTapGesture() {
    let tapGesture = UITapGestureRecognizer(target: self,
                                            action: #selector(handleDoubleTapSelected(_:)))
    tapGesture.numberOfTapsRequired = 2
    addGestureRecognizer(tapGesture)
  }
  
  @objc
  func handleTapSelected(_ sender: UITapGestureRecognizer) {
    delegate?.handleTapSelected(self)
  }
  
  @objc
  func handleDoubleTapSelected(_ sender: UITapGestureRecognizer) {
    delegate?.handleDoubleTapSelected(self)
  }
}
