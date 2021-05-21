//
//  ViewController.swift
//  iOSTask
//
//  Created by Fuad Hasan on 21/5/21.
//

import UIKit

class HomePageVC: UIViewController {
    
    var collectionView:GridCollectionView!
    
    let numberOfUser = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationItem.title  = "Friends"
        
        setupCollectionViewForGridView()
        
        fetchUser()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadNewUser))
        
        
        
    }
    
    @objc func reloadNewUser(){
        fetchUser()
    }
    
    
    fileprivate func fetchUser(){
        
        let urlString  =  "https://randomuser.me/api/?results=\(numberOfUser)"
        
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.showSpinner()
        Service.shared.fetchUser(urlString: urlString) { result in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.stopSpinner()
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                    self.collectionView.users = result.results
                }
            case .failure(let error):
                
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    
    
    //
    
    fileprivate func setupCollectionViewForGridView(){
        
        self.collectionView = GridCollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout())
        
        self.collectionView.backgroundColor = .white
        self.view.addSubview(collectionView)        
        
        collectionView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, trailing: self.view.trailingAnchor)
        
        self.collectionView.didselectClosure = { [weak self] user in
            
            guard let self = self else {return}
            
            let vc = UserDetailsVC()
            vc.user = user
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    //  For resizing cells on device rotate - Swift
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // Have the collection view re-layout its cells.
        coordinator.animate(
            alongsideTransition: { _ in self.collectionView.collectionViewLayout.invalidateLayout() },
            completion: { _ in }
        )
    }
    
    
}

