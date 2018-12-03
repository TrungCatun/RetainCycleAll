//
//  ViewController.swift
//  RetainCycle1
//
//  Created by Trung on 12/3/18.
//  Copyright © 2018 Trung. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {
    
    weak var vcB: ViewControllerB?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        vcB = segue.destination as? ViewControllerB
        vcB?.vcA = self
    }
    
    deinit {
        print("deinit: \(type(of: self))")
    }

    func doSomething() {
        
    }
}


class ViewControllerB: UIViewController {
    
    var vcC: ViewControllerC?
    weak var vcA: ViewControllerA?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        vcC = segue.destination as? ViewControllerC
        vcC?.vcB = self
    }
    @IBAction func backButton(_ sender: UIButton) {
        vcA?.doSomething()
        dismiss(animated: true, completion: nil)
    }
    deinit {
        print("deinit: \(type(of: self))")
    }
    
}


class ViewControllerC: UIViewController {
    
    var vcB: ViewControllerB?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("deinit: \(type(of: self))")
    }
    
}
