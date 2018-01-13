//
//  EditViewController.swift
//  Navigation
//
//  Created by Yang Hyeon Gyu on 2018. 1. 8..
//  Copyright © 2018년 Yang Hyeon Gyu. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var isOn = false
    var isZoom = false
    var delegate: EditDelegate?
    
    @IBOutlet var isZoomButton: UIButton!
    @IBOutlet var labelWay: UILabel!
    @IBOutlet var textMessageField: UITextField!
    @IBOutlet var switchIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelWay.text = textWayValue
        textMessageField.text = textMessage
        switchIsOn.isOn = isOn
        
        if isZoom {
            isZoomButton.setTitle("확대", for: UIControlState.normal)
        } else {
            isZoomButton.setTitle("축소", for: UIControlState.normal)
        }
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
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: textMessageField.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func zoomImage(_ sender: UIButton) {
        if sender.currentTitle == "확대" {
            isZoom = true
            isZoomButton.setTitle("축소", for: UIControlState.normal)
        } else {
            isZoom = false
            isZoomButton.setTitle("확대", for: UIControlState.normal)
        }
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
}
