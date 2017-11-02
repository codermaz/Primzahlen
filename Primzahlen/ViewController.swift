//
//  ViewController.swift
//  Primzahlen
//
//  Created by MacMini on 01.11.17.
//  Copyright © 2017 MacMini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var iTimer : Int = 0;
    var timer = Timer();
    
    @objc func processTimer() {
        iTimer += 1;
        print ("Sekunden verpasst : \(iTimer) ");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ergebnisLabel.text = "";
        teilermengeTextView.text = "";
        schriftTeilermengeLabel.text = "";
        
        // timer        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var zahlEingegebenTextField: UITextField!

    @IBOutlet weak var ergebnisLabel: UILabel!
    
    @IBOutlet weak var schriftTeilermengeLabel: UILabel!

    @IBOutlet weak var teilermengeTextView: UITextView!

    @IBAction func timerStopPressed(_ sender: UIBarButtonItem) {
        timer.invalidate()
        print("Timer stopped")
    }
    
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
  //          -----einfach git versuchen ---
            var ergebnis = " Die Zahl \(zahl) ist";
            
            if (isPrimzahl) {
                ergebnis += " eine Primzahl. ";
                
                //UIColor example
               ergebnisLabel.textColor = UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0)
                
                teilermengeTextView.text = "";
                schriftTeilermengeLabel.text = "";

            } else {
                 ergebnis += " keine Primzahl. ";
                print(teilerMenge);
                ergebnisLabel.textColor = UIColor.red;
                schriftTeilermengeLabel.text = "Die Teilermenge ist: ";
                teilermengeTextView.text = String (describing: teilerMenge);
            }
            ergebnisLabel.text = ergebnis;
            
        }
        
    }
}

