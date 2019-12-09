//
//  BFNavigationItems.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 07/12/19.
//


import UIKit

@objc public protocol BFNavigationItemsDelegate: NSObjectProtocol {
  @objc optional func itemLeftTaped(sender: UIBarButtonItem)
  @objc optional func itemRightTaped(sender: UIBarButtonItem)
}

class BFNavigationItems: UINavigationItem {
  
  // MARK:- Delegate
  var delegate:BFNavigationItemsDelegate?
  
  public var itemTitle: NavigationItemType.TypeTitle? = .noTitleView {
    
    didSet {
      if itemTitle != nil {
        self.setTitleItem(itemTitle!)
      }
    }
  }
  
  public var itemLeft: NavigationItemType.TypeLeftButton? = .noButton {
    
    didSet {
      if itemLeft != nil {
        self.setLeftNavigationItem(itemLeft!)
      }
    }
  }
  
  public var itemRight: NavigationItemType.TypeRightButton? = .noButton {
    
    didSet {
      if itemRight != nil {
        self.setRightNavigationItem(itemRight!)
      }
    }
  }
}

// MARK: - Set NavigationItem
extension BFNavigationItems {
  
  func setTitleItem(_ itemType: NavigationItemType.TypeTitle) {
    var arrBtns: [UIBarButtonItem] = []
    switch itemType {
    case .titleViewInteractive(let value):
      break
    case .titleViewNonInteractive(let title):
      let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
      titleLabel.text = title
      titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
      titleLabel.textAlignment = .center
      titleLabel.isAccessibilityElement = true
      titleLabel.accessibilityTraits = UIAccessibilityTraits.header
      titleLabel.textColor = UIColor.white

      let customTitleView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
      customTitleView.addSubview(titleLabel)
      customTitleView.isAccessibilityElement = false
      self.titleView = customTitleView
      break 
    default:
      break
    }
  }
  
  func titleTaped(sender: UIBarButtonItem) {
    self.delegate?.itemLeftTaped!(sender: sender)
  }
}

// MARK: - Set Left NavigationItem
extension BFNavigationItems {
  
  func setLeftNavigationItem(_ itemType: NavigationItemType.TypeLeftButton) {
    var arrBtns: [UIBarButtonItem] = []
    switch itemType {
    case .btnBack:
      let barBtnLeft = UIBarButtonItem.init(image: #imageLiteral(resourceName: "IconBack"), style: .plain, target: self, action: #selector(btnLeftTaped))
          barBtnLeft.tintColor = ThemeColor
      if #available(iOS 13.0, *) {
        var imgInsets = barBtnLeft.imageInsets
        imgInsets.left = -8
        barBtnLeft.imageInsets = imgInsets
      }
      barBtnLeft.tintColor = ThemeColor
      barBtnLeft.accessibilityLabel = "Back"
      arrBtns.append(barBtnLeft)
      break
    case .btnClose:
      let barBtnLeft = UIBarButtonItem.init(image: #imageLiteral(resourceName: "bar-btn-close"), style: .plain, target: self, action: #selector(btnLeftTaped))
      barBtnLeft.tintColor = ThemeColor
      barBtnLeft.accessibilityLabel = "Close"
      arrBtns.append(barBtnLeft)
      break
    case .btnWithString(let value, let style):
      let barBtnLeft = UIBarButtonItem.init(title: value, style: style, target: self, action: #selector(btnLeftTaped))
      barBtnLeft.tintColor = ThemeColor
      arrBtns.append(barBtnLeft)
      break
    case .btnWithIcon(let image):
      let barBtnLeft = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(btnLeftTaped))
      barBtnLeft.tintColor = ThemeColor
      arrBtns.append(barBtnLeft)
      break
      case .btnWithIconAndString(let image,let value, let style):
           let barBtnLeft = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(btnLeftTaped))
           barBtnLeft.style = style
           barBtnLeft.tintColor = ThemeColor
           arrBtns.append(barBtnLeft)
           break
    default:
      break
    }
    self.setLeftBarButtonItems(arrBtns, animated: true)
  }
  
  @objc func btnLeftTaped(sender: UIBarButtonItem) {
    self.delegate?.itemLeftTaped!(sender: sender)
  }
}

// MARK: - Set Right NavigationItem
extension BFNavigationItems {
  func setRightNavigationItem(_ itemType: NavigationItemType.TypeRightButton) {
    var arrBtns: [UIBarButtonItem] = []
    switch itemType {
    case .btnWithString(let value, let style):
      let barBtn = UIBarButtonItem.init(title: value, style: style, target: self, action: #selector(btnRightTaped))
      barBtn.tintColor = ThemeColor
      arrBtns.append(barBtn)
      break
    case .btnWithIcon(let image):
      let barBtn = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(btnRightTaped))
      barBtn.tintColor = ThemeColor
      arrBtns.append(barBtn)
      break
    case .btnClose:
      let barBtn = UIBarButtonItem.init(image: #imageLiteral(resourceName: "bar-btn-close"), style: .plain, target: self, action: #selector(btnLeftTaped))
      barBtn.tintColor = ThemeColor
      arrBtns.append(barBtn)
      break
    default:
      break
    }
    self.setRightBarButtonItems(arrBtns, animated: true)
  }
  
  @objc func btnRightTaped(sender: UIBarButtonItem) {
    self.delegate?.itemRightTaped!(sender: sender)
  }
}

// MARK: - NavigationItem Type
enum NavigationItemType {

  enum TypeTitle {
    case noTitleView
    case titleViewInteractive(value: Any)
    case titleViewNonInteractive(title: String)
  }

  enum TypeLeftButton {
    case noButton
    case btnBack
    case btnClose
    case btnWithString(value: String, style: UIBarButtonItem.Style)
    case btnWithIcon(image: UIImage)
    case btnWithIconAndString(image: UIImage, value: String, style: UIBarButtonItem.Style)

  }

  enum TypeRightButton {
    case noButton
    case btnWithString(value: String, style: UIBarButtonItem.Style)
    case btnWithIcon(image: UIImage)
    case btnClose
  }

  case TitleView(type: TypeTitle)
  case LeftButton(type: TypeLeftButton)
  case RightButton(type: TypeRightButton)
}

