//
//  LoadMoreViewController.swift
//  Project1
//
//  Created by Cacttus Education on 7.6.23.
//

import UIKit


class LoadMoreViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var recipes: [Recipe] = []
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Call the API and populate the 'recipes' array
           fetchRecipes()
           
           // Configure the collection view
           collectionView.dataSource = self
           collectionView.delegate = self
           collectionView.reloadData()
       }
       
       func fetchRecipes() {
           guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?number=50&apiKey=94a2522f5d1c4a46a8ecad96819d2eec&type=snack=vegan&addRecipeInformation=true&fullIngredients=true") else {
               print("Invalid API URL")
               return
           }
           
           URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
               guard let self = self else { return }
               
               if let error = error {
                   print("Error: \(error)")
                   return
               }
               
               guard let data = data else {
                   print("No data received")
                   return
               }
               
               do {
                   let response = try JSONDecoder().decode(RecipeResponse.self, from: data)
                   self.recipes = response.results
                   
                   DispatchQueue.main.async {
                       self.collectionView.reloadData()
                   }
               } catch {
                   print("Error decoding JSON: \(error)")
               }
           }.resume()
       }
   }

     extension LoadMoreViewController: UICollectionViewDataSource {
         
         func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return recipes.count
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LoadMoreCollectionViewCell
                
                let recipe = recipes[indexPath.row]
                cell.titleLbl.text = recipe.title
                
                // Load image asynchronously
                if let imageURL = URL(string: recipe.image) {
                    URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                        if let error = error {
                            print("Error loading image: \(error)")
                            return
                        }
                        
                        guard let data = data, let image = UIImage(data: data) else {
                            print("Invalid image data")
                            return
                        }
                        
                        DispatchQueue.main.async {
                            // Assign the image to the cell's image view
                            cell.imageView.image = image
                        }
                    }.resume()
                }
                cell.layer.borderWidth=1
                cell.layer.cornerRadius=23
                return cell
         }
        
     }
