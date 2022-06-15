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
    
    private var parks = [
    Park(name: "Парк культуры и отдыха им. М. Горького", parkImage: "Парк культуры и отдыха им. М. Горького", location: "ул. Крымский Вал, 9 (ст. м. Октябрьская)", openTime: "ежедневно, круглосуточно"),
    Park(name: "Нескучный сад", parkImage: "Нескучный сад", location: "ул. Крымский Вал, 9 (ст. м. Октябрьская)", openTime: "ежедневно, круглосуточно"),
    Park(name: "Парк «Зарядье»", parkImage: "Парк «Зарядье»", location: "ул. Варварка, 6, стр. 1 (ст. м. Китай-город)", openTime: "ежедневно, круглосуточно"),
    Park(name: "ВДНХ", parkImage: "ВДНХ", location: "просп. Мира, 119 (ст. м. ВДНХ)", openTime: "ежедневно, круглосуточно"),
    Park(name: "Парк «Сокольники»", parkImage: "Парк «Сокольники»", location: "ул. Сокольнический Вал, 1, стр. 1 (ст. м. Сокольники)", openTime: "ежедневно, круглосуточно"),
    Park(name: "Парк «Останкино»", parkImage: "Парк «Останкино»", location: "ул. 1-я Останкинская, д. 5 (ст. м. Фонвизинская)", openTime: "ежедневно, круглосуточно"),
    Park(name: "Парк «Ходынское поле»", parkImage: "Парк «Ходынское поле»", location: "Ходынский бульвар (ст. м. ЦСКА)", openTime: "ежедневно, круглосуточно"),
    Park(name: "Парк искусств «Музеон»", parkImage: "Парк искусств «Музеон»", location: "ул. Крымский Вал, 2/58 (ст. м. Октябрьская)"),
    Park(name: "Парк «Тюфелева роща»", parkImage: "Парк «Тюфелева роща»", location: "ул. Архитектора Леонидова (ст. м. Автозаводская)"),
    Park(name: "Парк-заповедник «Царицыно»", parkImage: "Парк-заповедник «Царицыно»", location: "Дольская ул., 1 (ст. м. Царицыно)", openTime: "со вторника по пятницу с 10:00 до 18:00, по субботам с 10:00 до 20:00, по воскресеньям с 10:00 до 19:00"),
    Park(name: "Парк-заповедник «Коломенское»", parkImage: "Парк-заповедник «Коломенское»", location: "просп. Андропова, 39 (ст. м. Коломенская)", openTime: "ежедневно с 06:00 до 22:00"),
    Park(name: "Парк Победы на Поклонной горе", parkImage: "Парк Победы на Поклонной горе", location: "ст. м. Минская/Парк Победы"),
    Park(name: "Парк «Новодевичьи пруды»", parkImage: "Парк «Новодевичьи пруды»", location: "Новодевичий проезд, 1 (ст. м. Спортивная)"),
    Park(name: "Александровский сад", parkImage: "Александровский сад", location: "ст. м.Александровский сад"),
    Park(name: "Парк «Фили»", parkImage: "Парк «Фили»", location: "Большая Филёвская ул., 22 (ст. м. Багратионовская)", openTime: "ежедневно с 06:00 до 22:00"),
    Park(name: "Парк «Патриот»", parkImage: "Парк «Патриот»", location: "Московская обл., Одинцовский район, 55 км. Минского шоссе", openTime: "со вторника по пятницу с 10:00 до 17:00, по субботам и воскресеньям с 10:00 до 18:00"),
    Park(name: "Парк «Красная Пресня»", parkImage: "Парк «Красная Пресня»", location: "Мантулинская ул., 5, стр. 2 (ст. м. Выставочная)"),
    Park(name: "Гончаровский парк", parkImage: "Гончаровский парк", location: "ул. Руставели, вл. 7 (ст. м. Бутырская)"),
    Park(name: "Измайловский парк", parkImage: "Измайловский парк", location: "аллея Большого Круга, 7 (ст. м. Шоссе Энтузиастов)"),
    Park(name: "Суворовский парк", parkImage: "Суворовский парк", location: "1-я Крылатская ул. (ст. м. Кунцевская)"),
    Park(name: "Воронцовский парк", parkImage: "Воронцовский парк", location: "ул. Воронцовские пруды (ст. м. Калужская)"),
    Park(name: "Парк «Кузьминки-Люблино»", parkImage: "Парк «Кузьминки-Люблино»", location: "ул. Заречье, 7 (ст. м. Волжская)", openTime: "ежедневно с 06:00 до 22:00"),
    Park(name: "Парк «Садовники»", parkImage: "Парк «Садовники»", location: "просп. Андропова, 58А (ст. м. Каширская)"),
    Park(name: "Перовский парк", parkImage: "Перовский парк", location: "ул. Лазо, 7 (ст. м. Перово)"),
    Park(name: "Парк «Мещерский»", parkImage: "Парк «Мещерский»", location: "Московская обл., Одинцовский район (ст. м. Солнцево)"),
    Park(name: "Парк 50-летия Октября", parkImage: "Парк 50-летия Октября", location: "ул. Удальцова, 22А (ст. м. Проспект Вернадского)", openTime: "с понедельника по четверг с 09:00 до 18:00, по пятницам с 09:00 до 16:45"),
    Park(name: "Парк музея-усадьбы «Кусково»", parkImage: "Парк музея-усадьбы «Кусково»", location: "ул. Юности, 2, стр. 1 (ст. м. Новогиреево)", openTime: "со среды по воскресенье с 10:00 до 18:00"),
    Park(name: "Парк «Бабушкинский»", parkImage: "Парк «Бабушкинский»", location: "ул. Менжинского, 6, стр. 3 (ст. м. Бабушкинская)", openTime: "ежедневно с 11:00 до 22:00"),
    Park(name: "Парк Дружбы", parkImage: "Парк Дружбы", location: "Флотская ул., 1А (ст. м. Речной вокзал)"),
    Park(name: "Лианозовский парк", parkImage: "Лианозовский парк", location: "Угличская ул., 13 (ст. м. Алтуфьево)", openTime: "с понедельника по четверг с 09:00 до 18:00, перерыв с 13:00 до 14:00; по пятницам с 09:00 до 17:00, перерыв с 13:00 до 14:00"),
    Park(name: "Парк «Дубки»", parkImage: "Парк «Дубки»", location: "ул. Дубки, 6 (ст. м. Тимирязевская)"),
    Park(name: "Парк «Алтуфьево»", parkImage: "Парк «Алтуфьево»", location: "Вологодский проезд (ст. м. Алтуфьево)"),
    Park(name: "Парк «Ростокинский Акведук»", parkImage: "Парк «Ростокинский Акведук»", location: "проезд Кадомцева, вл. 1, стр. 4 (ст. м. ВДНХ)", openTime: "ежедневно с 10:00 до 22:00"),
    Park(name: "Патриаршие пруды", parkImage: "Патриаршие пруды", location: "Малая Бронная ул. (ст. м. Маяковская)"),
    Park(name: "Парк возле главного здания МГУ им. Ломоносова", parkImage: "Парк возле главного здания МГУ им. Ломоносова", location: "микрорайон Ленинские Горы, 1 (ст. м. Ломоносовский проспект/Университет)")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return parks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ParkTableViewCell
        
        let park = parks[indexPath.row]
        cell.nameLable.text = park.name
        if park.parkImage != nil {
            cell.imageOfPark.image = UIImage(named: park.parkImage!)
        } else {
            cell.imageOfPark.image = park.image
        }
        
        cell.locationLable.text = park.location
        cell.openTimeLable.text = park.openTime
        
        cell.imageOfPark.layer.cornerRadius = cell.imageOfPark.frame.height / 2
        
         
        cell.imageOfPark.clipsToBounds = true
                
        return cell
    }
    
    
    // MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newParkVC = segue.source as? AddParkViewController else { return }
        
        newParkVC.saveNewPark()
        parks.append(newParkVC.newPark!)
        
        tableView.reloadData()
    }

}
