//
//  ResultViewController.swift
//  Calculator
//
//  Created by Юрий Гриневич on 29.01.2022.
//

import UIKit

class ResultViewController: UIViewController {

    var mean: String?
    var srel: String?
    var real: String?
    
    @IBOutlet weak var meanLabel: UILabel!
    @IBOutlet weak var srelLabel: UILabel!
    @IBOutlet weak var realLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        meanLabel.text = mean
        srelLabel.text = srel
        realLabel.text = real
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
