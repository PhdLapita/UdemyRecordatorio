//
//  IconsViewController.swift
//  UdemyRecordatorio
//
//  Created by Bear on 28/12/16.
//  Copyright © 2016 BearCreekMining. All rights reserved.
//

import UIKit

class IconsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var iconList: [[String:String]] = [[String:String]]()
    var icons: Array<String> = Array<String>()
    var headerTitleString : String?
    var selectedTask: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconList.append(["icon": "img_icono_compra", "title": "Compra"])
        iconList.append(["icon": "img_icono_economia", "title": "Economía"])
        iconList.append(["icon": "img_icono_amor", "title": "Amor"])
        iconList.append(["icon": "img_icono_amigos", "title": "Amigos"])
        iconList.append(["icon": "img_icono_lugares", "title": "Lugares"])
        iconList.append(["icon": "img_icono_fechas", "title": "Fechas"])
        iconList.append(["icon": "img_icono_webs", "title": "Webs"])
        iconList.append(["icon": "img_icono_archivos", "title": "Archivos"])
        iconList.append(["icon": "img_icono_musica", "title": "Musica"])
        iconList.append(["icon": "img_icono_vacaciones", "title": "Vacaciones"])
        iconList.append(["icon": "img_icono_ideas", "title": "Ideas"])
        iconList.append(["icon": "img_icono_deportes", "title": "Deportes"])
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath)
        let icon = iconList[indexPath.row]
        if let  cell = cell as? IconCell {
            if let icon = icon["icon"] {
                cell.icon.image = UIImage(named: icon)
            }
            if let title = icon["title"]{
                cell.title.text = title
            }
        }
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        headerView.txtName.text = headerTitleString
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let icon  = iconList[indexPath.row]
        
        if let selectedTask = selectedTask{
            TaskManager.sharedInstance.tasks[selectedTask]["icon"] = icon["icon"]
            let _ = navigationController?.popViewController(animated: true)//la expresion tiene un warning pero no es nada asi que lo eliminamos de esta forma
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = collectionView.frame.size.width / 3.5
        return CGSize(width: maxWidth, height:maxWidth)
    }
    
     
 }
