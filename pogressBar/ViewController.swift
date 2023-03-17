//
//  ViewController.swift
//  pogressBar
//
//  Created by HARSHID PATEL on 27/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    var time = Timer()

    @IBOutlet weak var pg: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pg.progress = 0.0
        progress()
    }
    
    func progress(){
        var a : Float = 0.0
        self.pg.progress = a
        time = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { Timer in
            a+=0.01
            self.pg.progress = a
            if self.pg.progress == 1.0{
                self.navigate()
                self.time.invalidate()
                self.pg.progress = 0.0
            }
        })
    }
    
    func navigate(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigation, animated: true)
    }
}

