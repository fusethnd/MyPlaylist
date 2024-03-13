//
//  ContentView.swift
//  MyPlaylist
//
//  Created by Thanadon Boontawee on 13/3/2567 BE.
//

// import Foundation
import SwiftUI

// Define your client ID and redirect URI
let clientID = "2680f837b2e446f09e58ae6d3e921247"
let redirectURI = "spotify-ios-quick-start://spotify-login-callback"

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                // Perform login action
                performLogin()
            }) {
                Text("Log in with Spotify")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
    
    func performLogin() {
        // Generate a random state string : secret id
        let state = "276e008476ee4990868c7fec8408cfed"
        
        // Define the scope
        let scope = "user-read-private user-read-email"
        
        // Construct the authorization URL
        let baseURL = "https://accounts.spotify.com/authorize"
        let queryParams = [
            "response_type": "code",
            "client_id": clientID,
            "scope": scope,
            "redirect_uri": redirectURI,
            "state": state
        ]
        
        // Construct the full URL
        var components = URLComponents(string: baseURL)!
        components.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        let authURL = components.url!
        
        // Open the authorization URL in Safari
        UIApplication.shared.open(authURL)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
