//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Pablo Gómez on 20/1/23.
//

import Foundation


class LoginViewModel: NSObject {
    
    let apiClient = ApiClient(token: "")
    
    func login(email: String?, password: String?, completion: @escaping(String?) -> Void){
        // Tal como lo he hecho no tiene mucho sentido el ViewModel, ya que solo actua como intermediario entre el ViewController
        // y el ApiClient sin aportar nada pero creo que aun así la estrcutura está bien, ya que en realidad en el ViewModel
        // tendría que almacenarse el token en una variable observable y el ViewController debería estar 'suscrito' a ella para
        // obtenerla cuando sea actualizada. (No lo he hecho así porque no lo hemos visto aún)

        guard let emailText = email, !emailText.isEmpty else {
            return completion("email is not valid!")
        }
        guard let passwordText = password, !passwordText.isEmpty else {
            return completion("password is not valid!")
        }
        
        apiClient.login(user: emailText, password: passwordText) { token, error in
            if let token = token {
                completion(token)
            } else {
                completion(error?.localizedDescription)
            }
        }
    }
}
