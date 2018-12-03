//
//  ViewController.swift
//  RetainCycle
//
//  Created by Trung on 12/3/18.
//  Copyright © 2018 Trung. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {

    
    weak var nextVC: ViewControllerA?
    weak var backVC: ViewControllerA?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        nextVC = segue.destination as? ViewControllerA
        nextVC?.backVC = self
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print(type(of: self), ": mm t da chet" )
    }


}



class ViewControllerB: ViewControllerA {

}
class ViewControllerC: ViewControllerA {

}
