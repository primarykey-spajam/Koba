//
//  NextViewController.swift
//  TodoApp
//
//  Created by admin on 2019/04/30.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

var ToDo = [String]()

class NextViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Todotextfield: UITextField!
    
    @IBAction func Add_text(_ sender: Any) {
        //変数に入力内容を入れる
        ToDo.append(Todotextfield.text!)
        //追加ボタンを押したらフィールドを空にする
        Todotextfield.text = ""
        //変数の中身をUDに追加
        UserDefaults.standard.set(ToDo, forKey: "ToDoList")
        //メイン画面に遷移
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: UIViewController = storyboard.instantiateViewController(withIdentifier: "Initial")
        self.present(next, animated: true, completion: nil)
    }
    
    @IBAction func Go_back(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: UIViewController = storyboard.instantiateViewController(withIdentifier: "Initial")
        self.present(next, animated: true, completion: nil)
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
