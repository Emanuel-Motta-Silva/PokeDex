//
//  ViewController.swift
//  PokeDex
//
//  Created by user212276 on 1/10/22.
//

import UIKit
import TinyConstraints
import WebKit

class PokeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, WKNavigationDelegate {
    
    //Outlets
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicador1: UIActivityIndicatorView!
    
    //Variaveis
    var pokemons: [Poke] = []
    var filteredPokemons = [Poke]()
    var inSearchMode = false
    var clickedPokemon: Poke?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Delegate e DataSource
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
        
        //Funçao fetchPoke que realiza o requerimento da API
        fetchPoke()
        //Funçao Loadadress que realiza a tela de loading enquanto a API carrega
        loadadress()
        
    }
    
    //Funçao para popular minha collection view, passando os dados que irao compor as celulas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            //let poke = pokemons[indexPath.row]
            let poke: Poke
            
            if inSearchMode {
                poke = filteredPokemons[indexPath.row]
                cell.configureCell(poke: poke)
            } else {
                poke = pokemons[indexPath.row]
                cell.configureCell(poke: poke)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
        
    //Funçao para navegar para outra view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        clickedPokemon = pokemons[indexPath.row]
        performSegue(withIdentifier: "navigation", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let viewDetailPokemon = segue.destination as? DetailPokemon {
        viewDetailPokemon.self.clickedPokemon = clickedPokemon
    } }
    
    
    //Funçao para verificar o numero de celulas que irao ser criadas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode{
            return filteredPokemons.count
        }
        return pokemons.count
    }
    
    //Funçao para pegar o numero de seçoes
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Funçao para tamanho da collection
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 104, height: 112)
    }
    
    //Funçao da SearchBar
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    //Funçao que realiza a funcionalidade da searchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            filteredPokemons = pokemons.filter({$0.nome.range(of: lower) != nil })
            collection.reloadData()
        }
    }
    
    //Funçao que realiza o loading da tela antes de API
    func loadadress(){
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false;
    }

    func webViewDidStartLoad(_: WKWebView){
        indicador1.startAnimating()
        indicador1.isHidden = false
    }
    
    func webViewdDidFinishLoad(_:WKWebView){
        indicador1.stopAnimating()
        indicador1.isHidden = true
    }

}

