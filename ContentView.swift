import SwiftUI

struct ContentView: View {
    var body: some View {
        // TabView to hold the main views
        TabView {
            CharacterView()
                .tabItem {
                    // Using a mask icon for the tab
                    Label("Characters", systemImage: "theatermasks.fill")
                }
            
            FlowersView()
                .tabItem {
                    Label("Flowers", systemImage: "leaf.fill")
                }
        }
        // Changing the accent color to purple for a "Joker-ish" vibe
        .accentColor(.purple)
    }
}

struct CharacterView: View {
    // 1. State variable to track the selected character
    @State private var selectedCharacter = "batman"
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Long press to choose your allegiance")
                .font(.headline)
                .padding()
                // 2. THE CONTEXT MENU
                .contextMenu {
                    // Option 1: Batman
                    Button(action: {
                        self.selectedCharacter = "batman"
                    }) {
                        Text("The Dark Knight")
                        // Using a built-in shield icon for the menu
                        Image(systemName: "shield.fill")
                    }
                    
                    // Option 2: Joker
                    Button(action: {
                        self.selectedCharacter = "joker"
                    }) {
                        Text("The Joker")
                        // Using a built-in smiley icon for the menu
                        Image(systemName: "face.smiling.inverse")
                    }
                }
            
            // 3. Logic to display the actual image based on selection
            if selectedCharacter == "batman" {
                // This looks for the image named "batman" in your Assets folder
                Image("batman")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .cornerRadius(12)
                    .shadow(radius: 10)
                
                Text("I am Vengeance.")
                    .font(.title2)
                    .fontWeight(.bold)
                
            } else if selectedCharacter == "joker" {
                // This looks for the image named "joker" in your Assets folder
                Image("joker")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .cornerRadius(12)
                    .shadow(color: .purple, radius: 10)
                
                Text("Why so serious?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
            }
        }
        .padding()
    }
}

// Placeholder for the second tab
struct FlowersView: View {
    var body: some View {
        Text("Placeholder for second tab")
    }
}

#Preview {
    ContentView()
}
