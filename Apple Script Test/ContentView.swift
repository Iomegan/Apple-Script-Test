//
//  ContentView.swift
//  Apple Script Test
//
//  Created by Daniel Witt on 06.12.24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var appleScript: String = "tell application \"Finder\" to get version"
    @State private var result: String = ""
    var body: some View {
        VStack {
            TextField("Script", text: $appleScript)
            Button("Run Apple Script") {
                let appleScript = appleScript
                var error: NSDictionary?

                if let scriptObject = NSAppleScript(source: appleScript) {
                    let result = scriptObject.executeAndReturnError(&error)
                    if let error = error {
                        print("Error: \(error)")
                    } else {
                        print("Result: \(result.stringValue ?? "No result")")
                        self.result = result.stringValue ?? "No result"
                    }
                }
            }
            LabeledContent("Result:") {
                Text(result)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
