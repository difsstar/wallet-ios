import Foundation

import UIKit
import Eureka
import MessageUI

protocol AboutViewControllerDelegate: class {
    func didPressURL(_ url: URL, in controller: AboutViewController)
}

final class AboutViewController: FormViewController {

    let viewModel = AboutViewModel()
    weak var delegate: AboutViewControllerDelegate?

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = viewModel.title

        form +++ Section()

            <<< linkProvider(type: .sourceCode)

            +++ Section()

            <<< linkProvider(type: .privacyPolicy)
            <<< linkProvider(type: .termsOfService)

            +++ Section()

            <<< AppFormAppearance.button { button in
                button.title = R.string.localizable.settingsEmailUsButtonTitle()
            }.onCellSelection { [weak self] _, _  in
                self?.sendUsEmail()
            }.cellUpdate({ (cell, _) in
                    cell.accessoryType = .disclosureIndicator
                    cell.textLabel?.textAlignment = .left
                    cell.textLabel?.textColor = .black
            })

            +++ Section()

            <<< TextRow {
                $0.title = R.string.localizable.settingsVersionLabelTitle()
                $0.value = Bundle.main.fullVersion
                $0.disabled = true
            }

            +++ Section(R.string.localizable.poweredBy())

            <<< linkProvider(type: .infura)
            <<< linkProvider(type: .dappsOpenSea)
    }
}
