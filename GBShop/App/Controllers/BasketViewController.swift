//
//  BasketViewController.swift
//  GBShop
//
//  Created by Сергей Горячев on 05.10.2021.
//

import UIKit

class BasketViewController: UIViewController {
    
    private let requestFactory = RequestFactory()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        createPayButton()
    }
    
    private func createPayButton() {
        let payButton = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        payButton.backgroundColor = .blue
        payButton.setTitle("Оплатить", for: .normal)
        payButton.addTarget(self, action: #selector(payBasketAction), for: .touchUpInside)
        self.view.addSubview(payButton)
    }
    
    @objc func payBasketAction(sender: UIButton) {
        let payBasket = requestFactory.makePayBasketRequestFactory()
        payBasket.payBasket(idUser: 123) { response in
            switch response.result {
            case .success(let payBasket):
                print("Денежные средства списаны, корзина пуста", payBasket)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
