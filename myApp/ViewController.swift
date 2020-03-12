/*
 while (alive){
    eat()
    sleep()
    code()
}
*/
//
//  ViewController.swift
//  myApp
//
//  Created by Bennard brune Parker on 05/03/2020.
//  Copyright © 2020 Solirize. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    var signInButton: GIDSignInButton?
    var secondViewController: UIViewController?
    let collectionViewLayout = UICollectionViewFlowLayout()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton()
    }
    
    func addButton() {
        signInButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        self.view.addSubview(signInButton!)
        signInButton?.center = self.view.center
    }
}

extension ViewController: GIDSignInUIDelegate, GIDSignInDelegate {
    
    override func loadView() {
        super.loadView()
        
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        secondViewController = SecondViewController(collectionViewLayout: collectionViewLayout)
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error)
        } else {
            print("Welcome " + user.profile.name)
            present(secondViewController!, animated: false, completion: nil)
        }
    }
}

