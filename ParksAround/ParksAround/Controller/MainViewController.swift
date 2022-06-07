//
//  MainViewController.swift
//  ParksAround
//
//  Created by Андрей  on 08.06.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    private var parkNames = [
        "Парк культуры и отдыха им. М. Горького", "Нескучный сад", "Парк «Зарядье»", "ВДНХ", "Парк «Сокольники»", "Парк «Останкино»", "Парк «Ходынское поле»", "Парк искусств «Музеон»", "Парк «Тюфелева роща»", "Парк-заповедник «Царицыно»", "Парк-заповедник «Коломенское»", "Парк Победы на Поклонной горе", "Парк «Новодевичьи пруды»", "Александровский сад", "Парк «Патриот»", "Парк «Красная Пресня»", "Гончаровский парк", "Измайловский парк", "Парк «Фили»", "Суворовский парк", "Воронцовский парк", "Парк «Кузьминки-Люблино»", "Парк «Садовники»", "Перовский парк", "Парк «Мещерский»", "Парк 50-летия Октября", "Парк музея-усадьбы «Кусково»", "Парк «Бабушкинский»", "Парк Дружбы", "Лианозовский парк", "Парк «Дубки»", "Парк «Алтуфьево»", "Парк «Ростокинский Акведук»", "Патриаршие пруды", "Парк возле главного здания МГУ им. Ломоносова"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return parkNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = parkNames[indexPath.row]
        
        return cell ?? UITableViewCell()
    }

}
