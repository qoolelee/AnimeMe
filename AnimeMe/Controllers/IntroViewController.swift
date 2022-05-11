//
//  IntroViewController.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/10.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var logoImageView: UIImageView!
    
    private let delayDuration = 0.5
    private let transDuration = 0.2

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - animation
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: transDuration, delay: delayDuration, options:[], animations: {
            self.backgroundView.alpha = 0.0
            self.logoImageView.alpha = 0.0
        }, completion: {
            re in
            self.backgroundView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
            self.logoImageView.image = UIImage(named: "AnimeMe_W_pdf")

            self.fadeInAnimeMe()
        })
    }
    
    func fadeInAnimeMe(){
        UIView.animate(withDuration: transDuration, delay: 0.0, options: [], animations: {
            self.backgroundView.alpha = 1.0
            self.logoImageView.alpha = 1.0
        }, completion: {
            re in
            
            self.fadeToMain()
        })
    }
    
    func fadeToMain(){
        UIView.animate(withDuration: transDuration, delay: delayDuration, options: [], animations: {
            self.backgroundView.alpha = 0.0
            self.logoImageView.alpha = 0.0
        }, completion: {
            re in
            
            self.performSegue(withIdentifier: "introToMain", sender: nil)
        })
    }
}
