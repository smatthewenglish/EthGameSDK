//
//  ViewController.swift
//  EthGameSDK
//
//  Created by s-matthew-english on 01/12/2020.
//  Copyright (c) 2020 s-matthew-english. All rights reserved.
//

import UIKit
import EthGameSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let addressContract = "0x13F74043eA61FE1BC62966A43f9cE9abbAD884E9"
        let addressToken = "0x3b66507597116b9bc4083a5D40Cc8a38D2a52F24"
        let apiKey = "G2BQF152Q8VT726472MMKGE11P45WED1DJ"
        
        let ethPollingAgent = EthPollingAgent()
        ethPollingAgent.hasTokenScan(addressContract: addressContract, addressToken: addressToken, apikey: apiKey) { (result) in
            if(result){
                print("TRUE")
                return
            }
            print("FALSE")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

