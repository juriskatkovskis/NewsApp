//
//  DetailViewController.swift
//  NewsApp
//
//  Created by juris.katkovskis on 25/08/2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    var item: Article?
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = item?.author
               titleLabel.text = item?.title
               descLabel.text = item?.articleDescription
               
               newsImageView.sd_setImage(with: URL(string: item?.urlToImage ?? ""))
               
               #warning("Save to core data")
           }
    
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        let activityVc = UIActivityViewController(activityItems: ["self.articles"], applicationActivities: nil)
        activityVc.popoverPresentationController?.sourceView = self.view
        self.present(activityVc, animated: true, completion: nil)
        
        
    }
    
           


           // MARK: - Navigation
           // In a storyboard-based application, you will often want to do a little preparation before navigation
           override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               // Get the new view controller using segue.destination.
               guard let dVC: WebViewController = segue.destination as? WebViewController else {return}
               // Pass the selected object to the new view controller.
               dVC.urlString = item?.url ?? ""
           }


       }
