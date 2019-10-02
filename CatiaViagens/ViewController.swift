//
//  ViewController.swift
//  CatiaViagens
//
//  Created by Catia Miranda de Souza on 02/10/19.
//  Copyright © 2019 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    //criar uma lista
    let listaViagens:Array<String> = ["Rio de Janeiro","Ceara","Sao Paulo"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //retorna qts elementos vem da lista
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    // mostra o conteudo q a celula tem q mostrar"que no caso e o "cell" q e o identifiquer da celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}

