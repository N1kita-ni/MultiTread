//
//  ViewController.swift
//  MultiThreed
//
//  Created by Никита Ничепорук on 7/6/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var secVC: SecondViewController?
    let imageLink = "https://thumb.tildacdn.com/tild6332-3265-4436-a636-323461643033/-/cover/720x720/center/center/-/format/webp/noroot.png"
    override func viewDidLoad() {
        super.viewDidLoad()
        secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecVC") as? SecondViewController
    }
    @IBAction func showAction(_ sender: Any) {
        guard let vc = secVC else {return}
        
        _ = vc.view
        
        DispatchQueue.global(qos: .background).async {
            if let imageURL = URL(string: self.imageLink),
                let imageData = try? Data(contentsOf: imageURL) {
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                     vc.imageView.image = image
                }
            }
        }
        navigationController?.show(vc, sender: nil)
    }
}
