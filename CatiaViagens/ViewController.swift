//
//  ViewController.swift
//  CatiaViagens
//
//  Created by Catia Miranda de Souza on 02/10/19.
//  Copyright © 2019 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tabelaViagens: UITableView!
    
    @IBOutlet weak var viewPacotes: UIView!
    @IBOutlet weak var viewsHoteis: UIView!
    
    //criar uma lista
    let listaViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.viewPacotes.layer.cornerRadius = 10
        self.viewsHoteis.layer.cornerRadius = 10            //configurando botao pacotes q ja esta conectado
    }
    
    //retorna qts elementos vem da lista
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    // mostra o conteudo q a celula tem q mostrar"que no caso e o "cell" q e o identifiquer da celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let viagemAtual = listaViagens[indexPath.row]
        cell.textLabel?.text = viagemAtual.titulo
        
        return cell
    }
}

