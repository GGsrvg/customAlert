//
//  CustomAlertController.swift
//  CustomAlert
//
//  Created by GGsrvg on 11.07.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class CustomAlertController: UIViewController {
   
   private var actions: [UIAlertAction]
   
   private lazy var alertView: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 6
      view.layer.masksToBounds = true
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
   }()
   
   private lazy var titleLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 18)
      label.textAlignment = .center
      return label
   }()
   
   private lazy var descriptionLabel: UILabel = {
      let label = UILabel()
      label.numberOfLines = 5
      label.font = UIFont.systemFont(ofSize: 14 )
      label.textAlignment = .center
      return label
   }()
   
   private lazy var stack: UIStackView = {
      let stack = UIStackView()
      stack.axis = .vertical
      stack.spacing = 12
      stack.translatesAutoresizingMaskIntoConstraints = false
      return stack
   }()
   
   private lazy var buttonsStack: UIStackView = {
      let stack = UIStackView()
      stack.axis = .vertical
      stack.spacing = 8
      return stack
   }()
   
   init(title: String, description: String?, actions: [UIAlertAction]){
      self.actions = actions
      super.init(nibName: nil, bundle: nil)
      self.titleLabel.text = title
      self.descriptionLabel.text = description
      
      modalPresentationStyle = .overFullScreen
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func loadView() {
      /* view
       titleLabel
       descriptionLabel
       stack
       */
      
      
      view = UIView()
      view.backgroundColor = .clear
      
      let blurEffect = UIBlurEffect(style: .extraLight)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.frame = view.bounds
      blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      view.addSubview(blurEffectView)
      
      view.addSubview(alertView)
      alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
      alertView.widthAnchor.constraint(equalToConstant: 300).isActive = true
      
      alertView.addSubview(stack)
      stack.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 12).isActive = true
      stack.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -12).isActive = true
      stack.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 12).isActive = true
      stack.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -12).isActive = true
      
      stack.addArrangedSubview(titleLabel)
      stack.addArrangedSubview(descriptionLabel)
      
      if actions.count > 0 {
         stack.addArrangedSubview(self.buttonsStack)
         
         if actions.count == 2 {
            buttonsStack.axis = .horizontal
         }
         
         for (index, action) in actions.enumerated() {
            if index > 3 {
               break
            }
            
            let button = makeButton(action: action)
            button.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
            buttonsStack.addArrangedSubview(button)
         }
         
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
   
   @objc func close(_ sender: Any){
      dismiss(animated: true)
   }
   
   private func makeButton(action: UIAlertAction) -> UIButton {
      let button = UIButton()
      button.setTitle(action.title ?? "", for: .normal)
      
      switch action.style {
      case .default:
         button.backgroundColor = .black
         button.setTitleColor(.white, for: .normal)
         button.setTitleColor(.gray, for: .highlighted)
      case .cancel:
         button.backgroundColor = .lightGray
         button.setTitleColor(.black, for: .normal)
         button.setTitleColor(.gray, for: .highlighted)
      case .destructive:
         break
      @unknown default:
         break
      }
      
      
      return button
   }
}
