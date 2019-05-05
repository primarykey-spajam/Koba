//
//  ViewController.swift
//  TodoApp
//
//  Created by admin on 2019/04/30.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //let ToDo = ["アプリ開発をする"]
    //var ToDo: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //追加した画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "ToDoList") != nil{
            ToDo = UserDefaults.standard.object(forKey: "ToDoList") as! [String]
            //ToDo.append("掃除をする")
        }
    }
    
    //セルの個数を指定するデリゲートメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDo.count
    }
    
    //セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = ToDo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //ToDoリストから削除
            ToDo.remove(at: indexPath.row)
            //table view cellの削除
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func GoNext(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SecondScreen", bundle: nil)
        let next: UIViewController = storyboard.instantiateViewController(withIdentifier: "Next")
        self.present(next, animated: true, completion: nil)
    }
    
}

