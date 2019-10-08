

import UIKit

//IMPLEMENTA O UIColletionView pq estamos usando ela no layout, obrigatoriamente vc implementa 2 metodos

class PacotesViagensViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate{
    
    //O PROTOCOLO UICollectionViewDelegate E PARA IMPLEMENTARMOS NOSSA 3 TELA
    @IBOutlet weak var colecaoPacotesViagens: UICollectionView!
    
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    let listaComTodasViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<Viagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        colecaoPacotesViagens.dataSource = self
        colecaoPacotesViagens.delegate = self
        pesquisarViagens.delegate = self          //IMPLEMENTANDO O SEARCH
        self.labelContadorPacotes.text = self.atualizaContadorLabel()

       
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
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width: larguraCelula - 10, height: 160)
    }
    // 3 TELA
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("CLICOU EM UMA VIAGEM")
    }
    //CAPTURAR O TEXTO Q USUARIO DIGITOU
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        listaViagens = listaComTodasViagens
        
        if searchText != ""{
             // FILTRANDO PELO ATRIBUTO DA CLASSE VIAGEM
                   let filtroListaViagem = NSPredicate(format: "titulo contains %@", searchText)
                   
                   //GUARDANDO INFORMACOES FILTRADAS Q USUARIO DIGITOU DENTRO DE OUTRO ARRAY
                   let listaFiltrada:Array<Viagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
                   //SUBSTITUINDO AS LISTAS
                   listaViagens = listaFiltrada
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
            colecaoPacotesViagens.reloadData()
        
    }
    func atualizaContadorLabel() -> String{
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
    
}
