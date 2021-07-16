//
//  ViewController.swift
//  MultiThreed
//
//  Created by Никита Ничепорук on 7/6/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    var secVC: SecondViewController?
    let imageLink = "https://zoogalaktika.ru/assets/images/mammalia/primates/catarrhini/erythrocebus-patas/erythrocebus-patas_12.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()
        secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecVC") as? SecondViewController
    }
    @IBAction func showAction(_ sender: Any) {
        guard let vc = secVC else {return}
        
        _ = vc.view
        
//        DispatchQueue.global(qos: .background).async {
//            if let imageURL = URL(string: self.imageLink),
//                let imageData = try? Data(contentsOf: imageURL) {
//                let image = UIImage(data: imageData)
//                DispatchQueue.main.async {
//                     vc.imageView.image = image
//                }
//            }
//        }
//
        vc.imageView.sd_setImage(with: URL(string: self.imageLink), completed: nil)
        navigationController?.show(vc, sender: nil)
    }
}
