//
//  CellNode.swift
//  TextureScroll
//
//  Created by Jeremie Aouate on 12/03/2019.
//  Copyright © 2019 Jeremie Aouate. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class CellNode: ASCellNode {
    private let messageTextNode: ASTextNode = ASTextNode()
    private let backgroundNode: ASDisplayNode = ASDisplayNode()
    
    init(message: String) {
        super.init()
        automaticallyManagesSubnodes = true
        let attributed = NSMutableAttributedString(string: message)
        attributed.setAttributes([ .font: UIFont.boldSystemFont(ofSize: 14)], range: NSMakeRange(0, message.count))
        messageTextNode.attributedText = attributed
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let inset: ASLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 4, bottom: 10, right: 4), child: messageTextNode)
        return inset
    }
}
