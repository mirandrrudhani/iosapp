//
//  HomeViewController.swift
//  Project1
//
//  Created by user230069 on 4/16/23.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
    @IBAction func didTapMenu(_ sender: Any) {
        present(menu!,animated: true)
    }
    var menu:SideMenuNavigationController?
    var user: User?
  
    @IBOutlet weak var collectionView: UICollectionView!
    var images:[String]=["Burger","DonerKebab","FruitPizza","Macaroni","MacaroniSalad","MeatBall","Meatloaf","Mushroom","Pancakes","Pizza","soup","Spaghetti"]
       var titles:[String]=["Burger","Doner Kebab","Fruit Pizza","Macaroni","Macaroni Salad","Meat Ball","Meat loaf","Mushroom","Pancakes","Pizza","Soup","Spaghetti"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
               
               let menuListController = MenuListController()
               menu = SideMenuNavigationController(rootViewController: menuListController)
               menu?.setNavigationBarHidden(true, animated: false)
               SideMenuManager.default.leftMenuNavigationController = menu
        menu?.presentationStyle = .menuSlideIn
               menu?.menuWidth = view.bounds.width * 0.8
               menu?.animationOptions = .curveEaseInOut
           }
           
          
            
            
        }

        extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return titles.count
            }
           
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",for : indexPath) as! CollectionViewCell
                cell.layer.borderWidth=1
                cell.layer.cornerRadius=23
                cell.imageView.image=UIImage(named: images[indexPath.row])
                cell.titleLbl.text=titles[indexPath.row]
                
           
              
                return cell
            }
            func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
                let size = (collectionView.frame.size.width - 10)/2
                return CGSize(width: size, height: size)
            }
            
            
        }
class MenuListController: UITableViewController {
    var items = ["About Us","Location","Order Food","Profile","Load More"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textAlignment = .center 
               cell.backgroundColor = .clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let aboutUsVC = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
            navigationController?.pushViewController(aboutUsVC, animated: true)
        }else if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let locationVC = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
            navigationController?.pushViewController(locationVC, animated: true)
        }else if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let orderFoodVC = storyboard.instantiateViewController(withIdentifier: "OrderFoodViewController") as! OrderFoodViewController
            navigationController?.pushViewController(orderFoodVC, animated: true)
        }else if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let profileFoodVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            navigationController?.pushViewController(profileFoodVC, animated: true)
            
        }else if indexPath.row == 4 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loadMoreVC = storyboard.instantiateViewController(withIdentifier: "LoadMoreViewController") as! LoadMoreViewController
            navigationController?.pushViewController(loadMoreVC, animated: true)
            
        }
    }
    
}
