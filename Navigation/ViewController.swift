//
//  ViewController.swift
//  Navigation
//
//  Created by Yang Hyeon Gyu on 2018. 1. 7..
//  Copyright © 2018년 Yang Hyeon Gyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imageOn = UIImage(named: "01.png")
    let imageOff = UIImage(named: "02.png")
    
    var isOn = true
    var isZoom = true
    
    @IBOutlet var textMessageField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = imageOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use Button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar Button"
        }
        
        editViewController.textMessage = textMessageField.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }

    func didMessageEditDone(_ controller: EditViewController, message: String) {
        textMessageField.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imageView.image = imageOn
            self.isOn = true
        } else {
            imageView.image = imageOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom {
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
            imageView.frame.size = CGSize(width: newWidth, height: newHeight)
            self.isZoom = false
        } else {
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale
            imageView.frame.size = CGSize(width: newWidth, height: newHeight)
            self.isZoom = true
        }
    }
}

