//
//  ViewController.swift
//  searchBar-TableView
//
//  Created by İSMAİL AÇIKYÜREK on 21.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    var ulkeler = [String]()
    var aramasonucSehirler : [String] = [String]()
    var aramaYapiyorumu = false
    
@IBOutlet weak var searchBar: UISearchBar!
@IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        
        self.searchBar.delegate = self
        ulkeler = ["ankara","izmir","ardahan","artvin","istanbul","bolu","bursa","bilecik","bartın","balıkesir","bitlis","batman","kilis","kayseri","kastamano","kırıkkale","antalya","adıyaman","aksaray","aydın","amasya","bingöl","burdur","bayburt","çanakkele","çankırı","çorum","denizli","düzce","diyarbakır","erzincan","elazığ","erzurum","edirne","eskişehir","giresun","gümüşhane","gazizntep","hatay","hakkari","karaman","kahramanmaraş","kırklareli","kütahya","kocaeli","kıeşehir","konya","mersin","malatya","manisa","mardin","muğla","adana","ordu","osmaniye","rize","samsun","sivas","sakarya","sinop","tunceli","tokat","tekirdap","uşak","şanlıurfa","şırnak","van","yalova","yozgat","zonguldak","ığdır","ağrı","kars","muş","Karabük","ısparta","afyon","niğde","nevşehir","siirt"]
        print(ulkeler.count)
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        aramaYapiyorumu  = true
        aramasonucSehirler = ulkeler.filter( {$0.lowercased().contains(searchText.lowercased())}) //İÇİNDE O HARF VAR
        aramasonucSehirler = ulkeler.filter( {$0.lowercased().prefix(searchText.count) == searchText.lowercased()}) //ARANAN HARFLE BAŞLAYAN
        tableview.reloadData()
    }

    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if aramaYapiyorumu {
            return aramasonucSehirler.count
        } else {
            return ulkeler.count
          
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if aramaYapiyorumu {
            cell.textLabel?.text =  aramasonucSehirler[indexPath.row]
        } else {
            cell.textLabel?.text =  ulkeler[indexPath.row]
        }
        return cell
    }
    
  

}

