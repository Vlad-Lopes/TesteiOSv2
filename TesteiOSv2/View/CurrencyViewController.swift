//
//  CurrencyViewController.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 09/02/21.
//

import UIKit

class CurrencyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblAccountNumber: UILabel!
    @IBOutlet weak var lblAccountBalance: UILabel!
    @IBOutlet weak var lblPeriodo: UILabel!
    
    @IBOutlet weak var tableViewItens: UITableView!
    
    var cliente = Cliente(clientId: 1, name: "nome de teste", bankAccount: "0123", agency:"5678901234" , balance: 1000)
    var lancamentos: [Account] = []
    
    let formatador = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    //    tableViewItens.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        var accountManager = AccountManager()
        accountManager.delegate = self
        accountManager.FetchAccount(id: 1)  // cliente!.clientId)
        
        formatador.locale = Locale(identifier: "pt_BR")
        formatador.numberStyle = .currency
 
        var agency = self.cliente.agency
        agency.insert(".", at: agency.index(agency.startIndex, offsetBy: 2))
        agency.insert("-", at: agency.index(agency.startIndex, offsetBy: 8))
       
        
        self.lblUserName.text = self.cliente.name
        self.lblAccountNumber.text = "\(self.cliente.bankAccount) / \(agency) "
        self.lblAccountBalance.text = formatador.string(from: NSNumber(value: self.cliente.balance))

        lblPeriodo.text = "Recentes"

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lancamentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemViewCell
        
        let lancamento = lancamentos[indexPath.row]
  
        cell.lblTipo.text = lancamento.tipo
        cell.lblData.text = lancamento.data
        cell.lblIdent.text = lancamento.ident
        cell.lblValor.text = formatador.string(from: NSNumber(value: lancamento.valor))

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func LogoutTouch(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
}

extension CurrencyViewController: AccountManagerDelegate {
   
    func didUpdateAccount (lancamentos: [Account]) {
        DispatchQueue.main.async {
            for account in lancamentos {
                self.lancamentos.append(account)
            }
            self.tableViewItens.reloadData()
            
           }
       }
       
    func didAccountError(error: Error){
           print(error)
       }
}
