

import UIKit

//IMPLEMENTA O UIColletionView pq estamos usando ela no layout, obrigatoriamente vc implementa 2 metodos

class PacotesViagensViewController: UIViewController,UICollectionViewDataSource{

    @IBOutlet weak var colecaoPacotesViagens: UICollectionView!
    
    let listaViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagens.dataSource = self
        

       
    }
    
    //1 metodo obrigatorio
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
        
    }
         // 2 obrigatorio
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath)
        as! PacoteViagensCollectionViewCell
        
        let viagemAtual = listaViagens[indexPath.item]
        
        celulaPacote.labelTitulo.text = viagemAtual.titulo
        celulaPacote.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celulaPacote.labelPreco.text = viagemAtual.preco
        celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
    
        
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 5
        
        return celulaPacote
    }
}
