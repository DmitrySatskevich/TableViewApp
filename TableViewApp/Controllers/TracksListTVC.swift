//
//  TracksListTVC.swift
//  TableViewApp
//
//  Created by dzmitry on 3.12.22.
//

import UIKit

class TracksListTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataServices.trackList.count
    }

    // Отображение данных в ячейках
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let track = DataServices.trackList[indexPath.row]
        cell.textLabel?.text = track.name
        cell.imageView?.image = UIImage(named: track.name)
        return cell
    }

    // Высота ячейки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    // MARK: - Table view delegate

    // Разрешение редактировать таблицу
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Удаление ячейки в таблице
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataServices.trackList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Поменять ячейки местами
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Перетащить ячейку откуда и куда
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let currentTrack = DataServices.trackList.remove(at: fromIndexPath.row)
        DataServices.trackList.insert(currentTrack, at: to.row)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
           let destVC = segue.destination as? TrackVC {
            destVC.track = DataServices.trackList[indexPath.row]
        }
    }
}
