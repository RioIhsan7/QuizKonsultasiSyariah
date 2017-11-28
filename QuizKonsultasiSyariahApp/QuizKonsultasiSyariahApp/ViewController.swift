//
//  ViewController.swift
//  QuizKonsultasiSyariahApp
//
//  Created by Rio_Ihsan on 10/24/17.
//  Copyright © 2017 mac os. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var namaSelected : String?
    var gambarSelected : String?
    
    @IBOutlet weak var tableView: UITableView!
    var KonsultasiName = ["Malpraktek Dokter, Siapa Nanggung Resiko","Tangan Lumpuh Saat Bangun Tidur","Minyak Zaitun Sebagai Pelumas Ketika Jimak","Hamil Terinfeksi Virus Toksoplasma","Ketika Tertelan Permen Karet"]
    var KonsulatsiFoto = [#imageLiteral(resourceName: "MalPraktekDokter"),#imageLiteral(resourceName: "TanganLumpuh"),#imageLiteral(resourceName: "MinyakZaitun"),#imageLiteral(resourceName: "HamilTerinveksi"),#imageLiteral(resourceName: "Permen")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return KonsultasiName.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        var KonsultasiNamaLabel = cell.viewWithTag(1) as! UILabel
        var KonsultasiImageView = cell.viewWithTag(2) as! UIImageView
        
        KonsultasiNamaLabel.text = KonsultasiName[indexPath.row]
        KonsultasiImageView.image = KonsulatsiFoto[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row)selected")
        namaSelected = self.KonsultasiName[indexPath.row]
        gambarSelected = self.KonsultasiName[indexPath.row]
        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passData" {
            let kirimData = segue.destination as! DetailViewController
            kirimData.passNamaKonsultasi = namaSelected
            kirimData.passGambarKonsultasi = gambarSelected
        }
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .normal, title: "More") {action, index in print("More Button Tapped")
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "descPraktek") as! MorePraktekViewController
            self.present(vc, animated: true, completion: nil)
        }
        let about = UITableViewRowAction(style: .normal, title: "About") {action, index in print("About Button Tapped")
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "about") as! AboutDevViewController
            self.present(vc, animated: true, completion: nil)
    }
        return [about,more]
}
}
