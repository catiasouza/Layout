

import UIKit

//IMPLEMENTA O UIColletionView pq estamos usando ela no layout, obrigatoriamente vc implementa 2 metodos

class PacotesViagensViewController: UIViewController,UICollectionViewDataSource {

    @IBOutlet weak var colecaoPacotesViagens: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagens.dataSource = self

       
    }
    //1 metodo obrigatorio
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    // 2 obrigatorio
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath)
        as! PacoteViagensCollectionViewCell
        celulaPacote.backgroundColor = UIColor.blue
        
        return celulaPacote
    }
}
