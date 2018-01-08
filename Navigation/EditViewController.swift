//
//  EditViewController.swift
//  Navigation
//
//  Created by Yang Hyeon Gyu on 2018. 1. 8..
//  Copyright © 2018년 Yang Hyeon Gyu. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    var textWayValue: String = ""
    @IBOutlet var labelWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelWay.text = textWayValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func done(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
