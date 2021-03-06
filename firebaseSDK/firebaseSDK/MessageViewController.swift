//
//  MessageViewController.swift
//  firebaseSDK
//
//  Created by Karen Rodriguez on 4/21/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView

let roverto = User(senderId: "AnyID", displayName: "EL ROVERTOOO")
let you = User(senderId: "AnyNoID", displayName: "Soulja Boy")
let messageFromRoverto = UserPost(sender: roverto, messageId: "123", sentDate: Date(), kind: MessageKind.text("ESKETIIIT"))
let messageFromYou = UserPost(sender: you, messageId: "121212", sentDate: Date(), kind: MessageKind.text("YOUUUUUUUUUUUUUUUUU"))
var messages: [MessageType] = [messageFromRoverto, messageFromYou]

class MessageViewController: MessagesViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        // I'm assuming I have to do this for input bar????
        messageInputBar.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension MessageViewController: MessagesDataSource, MessagesDisplayDelegate, MessagesLayoutDelegate {
    func currentSender() -> SenderType {
        return roverto
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
}

extension MessageViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let newMessage = UserPost(sender: self.currentSender(), messageId: UUID().uuidString, sentDate: Date(), kind: MessageKind.text(text))
        messages.append(newMessage)
        messagesCollectionView.reloadData()
    }
}
