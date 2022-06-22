//
//  TestCell.swift
//  TestProject
//
//  Created by Andrii Moisol on 22.06.2022.
//

import UIKit
import SwiftUI

class TestCell: UITableViewCell {
    var innerController: UIHostingController<TestView>?

    func configure(parent: UIViewController, text: String, action: @escaping () -> Void) {
        if let innerController = innerController {
            innerController.rootView = TestView(text: text, action: action)
            innerController.view.layoutIfNeeded()
        } else {
            let innerController = UIHostingController(rootView: TestView(text: text, action: action))
            parent.addChild(innerController)
            innerController.didMove(toParent: parent)
            contentView.addSubview(innerController.view)
            self.innerController = innerController
        }

        innerController?.view.invalidateIntrinsicContentSize()

        innerController?.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            innerController!.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            innerController!.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            innerController!.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            innerController!.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        innerController?.willMove(toParent: nil)
        innerController?.view.removeFromSuperview()
        innerController?.removeFromParent()
        innerController = nil
    }
}
