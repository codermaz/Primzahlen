//
//  ViewController.swift
//  Primzahlen
//
//  Created by MacMini on 01.11.17.
//  Copyright © 2017 MacMini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ergebnisLabel.text = "";
        teilermengeLabel.text = "";
        schriftTeilermengeLabel.text = "";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var zahlEingegebenTextField: UITextField!

    @IBOutlet weak var ergebnisLabel: UILabel!
    
    @IBOutlet weak var schriftTeilermengeLabel: UILabel!
    @IBOutlet weak var teilermengeLabel: UILabel!
    
    @IBAction func berechnenPressed(_ sender: UIButton) {
        let zahl = Int (zahlEingegebenTextField.text!)!;
        var isPrimzahl = true;
        var teilerMenge : [Int] = [];
        
        if (zahl >= 2) {
            var i = 2;
            while (zahl>i) {
                if (zahl % i == 0) {
                    teilerMenge.append(i);
                    isPrimzahl = false;
                }
                i += 1;
            }
            var ergebnis = " Die Zahl \(zahl) is";
            if (isPrimzahl) {
                ergebnis += " eine Primzahl. ";
                ergebnisLabel.textColor = UIColor.green;
                teilermengeLabel.text = "";
                schriftTeilermengeLabel.text = "";

            } else {
                 ergebnis += " keine Primzahl. ";
                print(teilerMenge);
                ergebnisLabel.textColor = UIColor.red;
                schriftTeilermengeLabel.text = "Die Teilermenge ist: ";
                teilermengeLabel.text = String (describing: teilerMenge);
            }
            ergebnisLabel.text = ergebnis;
            
        }
        
    }
}

