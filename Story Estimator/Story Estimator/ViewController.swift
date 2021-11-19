//
//  ViewController.swift
//  Story Estimator
//
//  Created by philips on 19/09/20.
//  Copyright © 2020 philips. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {
    @IBOutlet weak var titleText: NSTextField!
    @IBOutlet weak var descriptionText: NSTextField!
    @IBOutlet weak var estimationLabel: NSTextField!
    @IBOutlet weak var estimateButton: NSButton!
    @IBOutlet var backgroundView: NSView!
    let predictor = Se()
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.delegate = self
        descriptionText.delegate = self
        estimationLabel.isHidden = true
    }

    override var representedObject: Any? {
        didSet {

        }
    }

    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {

        if let textField = control as? NSTextField {
            print(textField.stringValue)
        }

        return true
    }


    @IBAction func onEstimateTapped(_ sender: Any) {
        let title = titleText.stringValue
        let description = descriptionText.stringValue

        let inputString = title + " " + description
        do{
            let output = try predictor.prediction(text: inputString).label
            let outputString = output.replacingOccurrences(of: "\"", with: "")

            estimationLabel.stringValue = outputString
            print(outputString)
            estimationLabel.isHidden = false
        } catch {

        }


    }

}

