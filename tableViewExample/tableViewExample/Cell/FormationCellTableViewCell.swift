//
//  FormationCellTableViewCell.swift
//  tableViewExample
//
//  Created by Miguel Eduardo  Valdez Tellez  on 05/03/21.
//

import UIKit

class FormationCellTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableSubFormation: UITableView!
    @IBOutlet weak var despegableButton: UIButton!
    @IBOutlet weak var IconoImage: UIImageView!
    @IBOutlet weak var namaFormationLabel: UILabel!
    
    static let reuseIdentifier = "FormationCellTableViewCell"
    static let nib = UINib(nibName: FormationCellTableViewCell.reuseIdentifier, bundle: nil)
    
    @IBAction func despegableButtonAction(_ sender: Any) {
       
    }
    
    var subTypesFormation = ["Iniciación cristiana", "Niños", "Adolescentes y jóvenes", "Adultos y familia", "Vida consagrada y sacerdocio","Biblioteca"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableSubFormation.register(SubFormationTableViewCell.nib, forCellReuseIdentifier: SubFormationTableViewCell.reuseIdentifier)
        tableSubFormation.delegate = self
        tableSubFormation.dataSource = self
        tableSubFormation.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subTypesFormation.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableSubFormation.dequeueReusableCell(withIdentifier: "SubFormationTableViewCell", for: indexPath) as! SubFormationTableViewCell
        cell.subFormationLabel.text = subTypesFormation[indexPath.row]
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}
