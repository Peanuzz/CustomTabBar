//
//  OrderViewController.swift
//  CustomTabItem
//
//  Created by AJ-CHARA WAROROS on 2/6/2564 BE.
//

import UIKit

class OrderViewController: UIViewController {
  
  @IBOutlet weak var orderListButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("OrderViewController - viewDidLoad")
  }
  
  @IBAction private func tapOrderList() {
    let storyBoard: UIStoryboard = UIStoryboard(name: "OrderList", bundle: nil)
    let newVC = storyBoard.instantiateViewController(withIdentifier: "OrderList") as! OrderListViewController
    navigationController?.pushViewController(newVC, animated: true)
  }
}
