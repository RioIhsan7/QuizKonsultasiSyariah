//
//  DetailViewController.swift
//  QuizKonsultasiSyariahApp
//
//  Created by Rio_Ihsan on 10/24/17.
//  Copyright © 2017 mac os. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgKonsultasi: UIImageView!
    @IBOutlet weak var namaKonsultasi: UILabel!
    
    var passNamaKonsultasi:String?
    var passGambarKonsultasi:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgKonsultasi.image = UIImage(named: passGambarKonsultasi!)

        // Do any additional setup after loading the view.
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

}
