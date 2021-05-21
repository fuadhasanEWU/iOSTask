//
//  UserDetailsVC.swift
//  iOSTask
//
//  Created by Fuad Hasan on 21/5/21.
//

import UIKit
import MessageUI


class UserDetailsVC: UIViewController {
    
    var user:User?
    
    lazy var userDetails:[UserDetails] = [
        
        .init(propertyName: .fullName, propertyValue: "\(user?.name.title ?? "") \(user?.name.first ?? "") \(user?.name.last ?? "")"),
        .init(propertyName: .address, propertyValue: "\(user?.location?.street?.number ?? 0) \((user?.location?.street?.name ?? ""))"),
        .init(propertyName: .city, propertyValue: user?.location?.city ?? ""),
        .init(propertyName: .state
              , propertyValue: user?.location?.state ?? ""),
        .init(propertyName: .country, propertyValue: user?.location?.country ?? ""),
        .init(propertyName: .email, propertyValue: user?.email ?? ""),
        .init(propertyName: .cell, propertyValue: user?.cell ?? ""),
        .init(propertyName: .phone, propertyValue: user?.phone ?? "")
    ]
    
    var collectionView:UserDetailsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "\(user?.name.title ?? "") \(user?.name.first ?? "") \(user?.name.last ?? "")"
        
        
        setupCollectionViewForUserDetails()
        
        
    }
    
    fileprivate func setupCollectionViewForUserDetails(){
        
        
        
        self.collectionView = UserDetailsCollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout())
        self.view.addSubview(collectionView)
        self.collectionView.backgroundColor = .white
        
        collectionView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor)
        
        self.collectionView.userDetails = userDetails
        
        self.collectionView.didselectClosure = { [weak self] userDetails in
            
            guard let self = self else {return}
            if userDetails.propertyName == .email {
                
                
                let recipientEmail = userDetails.propertyValue
                
                //This will only work on Real Device
                // Show default mail composer
                if MFMailComposeViewController.canSendMail() {
                    let mail = self.configureMailController(mailAddress: recipientEmail)
                    
                    self.present(mail, animated: true)
                    
                    // Show third party email composer if default Mail app is not present
                } else if let emailUrl = self.createEmailUrl(to: recipientEmail, subject: "", body: "") {
                    UIApplication.shared.open(emailUrl)
                }
                
            }
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

extension UserDetailsVC : MFMailComposeViewControllerDelegate {
    
    func configureMailController(mailAddress:String) -> MFMailComposeViewController{
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([mailAddress])
        return mailComposerVC
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
        let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
        
        if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
            return gmailUrl
        } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
            return outlookUrl
        } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
            return yahooMail
        } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
            return sparkUrl
        }
        
        return defaultUrl
    }
    
    
    
}

