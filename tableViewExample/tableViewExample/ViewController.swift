//
//  ViewController.swift
//  tableViewExample
//
//  Created by Miguel Eduardo  Valdez Tellez  on 05/03/21.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var typesFormation = ["Iniciación cristiana", "Niños", "Adolescentes y jóvenes", "Adultos y familia", "Vida consagrada y sacerdocio","Biblioteca"]
    @IBOutlet weak var tableFormation: UITableView!
    var flagHeigt = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableFormation.register(FormationCellTableViewCell.nib, forCellReuseIdentifier: FormationCellTableViewCell.reuseIdentifier)
        tableFormation.delegate = self
        tableFormation.dataSource = self
    }

    
    //Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typesFormation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableFormation.dequeueReusableCell(withIdentifier: "FormationCellTableViewCell", for: indexPath) as! FormationCellTableViewCell
        cell.namaFormationLabel.text = typesFormation[indexPath.row]
        cell.IconoImage.image = UIImage(named: typesFormation[indexPath.row])
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? FormationCellTableViewCell {
            cell.despegableButton.rotar(angulo: CGFloat.pi, duracion: 0.2)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            flagHeigt = true
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let celda = cell as? FormationCellTableViewCell {
            celda.tableSubFormation.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if flagHeigt == false {
            return -1.0
        } else {
            return 450
        }
    }
}


