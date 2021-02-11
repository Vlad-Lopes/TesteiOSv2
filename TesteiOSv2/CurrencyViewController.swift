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
    
    var cliente: Cliente?
    var lancamentos: [Account] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var accountManager = AccountManager()
        accountManager.delegate = self
        accountManager.FetchAccount(id: 1)
        DispatchQueue.main.async {
            self.lblUserName.text = self.cliente!.name
            self.lblAccountNumber.text = self.cliente!.bankAccount
            self.lblAccountBalance.text = String(self.cliente!.balance)
        }
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
        cell.lblValor.text = String(lancamento.valor)

        return cell
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
       
    func didFailWithError(error: Error){
           print(error)
       }
}
