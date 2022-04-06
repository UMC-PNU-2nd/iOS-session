//
//  SecondViewController.swift
//  Protocol
//
//  Created by 정지윤 on 2022/04/04.
//

import UIKit

protocol ChangeLabelDelegate {
    func doChange(data: String)
}


class SecondViewController: UIViewController{
    
    var delegate : ChangeLabelDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonDismiss(_ sender: UIButton) {
        if let text = textField.text {
            delegate?.doChange(data: text)
        }
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
