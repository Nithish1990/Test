import UIKit

class ZStocksViewController: BaseVC{

    
    override func viewDidLoad() {
            super.viewDidLoad()
        configNavBar()
        addButton.setTitle("", for: .normal)
        addButton.setImage(UIImage(systemName: "number"), for: .normal)
        addButton.addTarget(self, action: #selector(didCalculateButtonTapped), for: .touchUpInside)
    }
    @objc private func didCalculateButtonTapped(){
        self.present(ReturnPercentageViewController(), animated: true)
    }
}
