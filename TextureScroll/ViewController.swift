//
//  ViewController.swift
//  TextureScroll
//
//  Created by Jeremie Aouate on 12/03/2019.
//  Copyright © 2019 Jeremie Aouate. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {
    private let tableNode: ASTableNode = ASTableNode()
    private var messages: [String] = []
    private var currentIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableNode()
        startTimer()
    }
    
    func setupTableNode(){
        tableNode.dataSource = self
        view.addSubnode(tableNode)
        
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            tableNode.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableNode.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableNode.view.topAnchor.constraint(equalTo: view.topAnchor),
            tableNode.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func startTimer(){
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) {[weak self] (timer) in
            guard let self = self else { return }
            self.messages.insert("\(self.currentIndex)", at: 0)
            self.tableNode.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
            self.currentIndex += 1
        }
    }
}

extension ViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNode = { [weak self] () -> ASCellNode in
            guard let self = self else { return ASCellNode() }
            let message = self.messages[indexPath.row]
            let node = CellNode(message: message)
            return node
        }
        return cellNode
    }
}
