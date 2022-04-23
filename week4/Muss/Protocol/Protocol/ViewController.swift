//
//  ViewController.swift
//  Protocol
//
//  Created by 정지윤 on 2022/04/04.
//

import UIKit


class ViewController: UIViewController, ChangeLabelDelegate {
    
    func doChange(data: String) {
        label.text = data
    }

    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func goNextVC(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else {return}
        
        nextVC.delegate = self
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

