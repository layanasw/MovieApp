//
//  ProfilePage.swift
//  MovieApp
//
//  Created by layan alwasaidi on 26/01/2025.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Header: "Profile"
            Text("Profile")
                .font(.system(size: 33, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.top)

            // Profile Card
            HStack(spacing: 15) {
                // Profile Image
                Circle()
                    .fill(Color.gray) // Placeholder image
                    .frame(width: 60, height: 60)

                VStack(alignment: .leading) {
                    Text("User Name") // Placeholder name
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("user@example.com") // Placeholder email
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                // Arrow Button to navigate to Profile Info Page
                NavigationLink(destination: ProfileInfoPage()) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.1))
            )
            .padding(.horizontal)

            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
