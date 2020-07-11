//
//  ViewController.swift
//  CustomAlert
//
//  Created by GGsrvg on 11.07.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBAction func presentAlert(_ sender: UIButton) {
      
      
      let actions: [UIAlertAction] = [
      UIAlertAction(title: "Cancel", style: .cancel, handler: nil),
      UIAlertAction(title: "Yes", style: .default, handler: nil),
//      UIAlertAction(title: "Read", style: .default, handler: nil),
      ]
      
      let custom = CustomAlertController(title: "Error", description: "Sorry man", actions: actions)
      present(custom, animated: true)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
   }


}

