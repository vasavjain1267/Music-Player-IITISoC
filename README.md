# HarmoniX – Music Streaming App

HarmoniX is a music streaming app designed to deliver a seamless and free listening experience. By integrating AI, international radio streaming, and personalized features, HarmoniX offers a unique and user-friendly platform for music lovers.

## Table of Contents

- Overview
- Achievements
- Features
- Tech Stack
- Getting Started
- Usage
- Project Structure
- Customization
- Contributing
- License

## Overview

HarmoniX aims to redefine music streaming by combining advanced technology with a focus on user experience. The app provides access to a wide range of music, live international radio, and personalized recommendations, all within a minimalist and animated interface.

Working alongside talented teammates Aryan Kumar, Yochana Mythri Gangyada, and Vasav Jain made this journey especially rewarding. The collaborative effort resulted in a product we are truly proud of.

## Achievements

- **2nd Position at IITISOC'24**  
  Indian Institute of Technology Indore Summer of Code (IITISoC 2024)

## Features

- **AI Chatbot for Music Recommendations:**  
  Get personalized song and playlist suggestions powered by AI.

- **Live Radio Streaming:**  
  Enjoy international radio stations, seamlessly integrated via Fast API.

- **Secure User Authentication:**  
  Robust authentication and user management using Firebase.

- **Minimalist & Animated UI:**  
  Experience a clean, modern interface enhanced with Lottie animations.

- **Customizable Interface:**  
  Personalize your listening environment to suit your preferences.

- **Smooth Performance:**  
  Fast, responsive, and reliable music and radio streaming.

## Tech Stack

| Technology   | Purpose                                      |
|--------------|----------------------------------------------|
| Flutter      | Cross-platform mobile app development        |
| Firebase     | User authentication and backend services     |
| Hive         | Local data storage                           |
| Fast API     | Backend for live radio streaming             |
| Deezer API   | Music catalog and streaming integration      |
| Lottie       | Animated UI elements                         |
| Others       | Additional libraries and tools as needed     |

## Getting Started

### Prerequisites

- A device with Android or iOS support
- Internet connection

### Installation

1. **Clone the repository:**
   ```bash
   git clone 
   ```
2. **Install dependencies:**
   - For Flutter:  
     ```bash
     flutter pub get
     ```
3. **Run the app:**
   - On Android/iOS device or emulator:  
     ```bash
     flutter run
     ```

## Usage

- Sign up or log in using secure Firebase authentication.
- Explore music, get AI-powered recommendations, and stream live radio.
- Personalize your experience through the settings and enjoy animated UI elements.

## Project Structure (Updated)

The HarmoniX (Music-Player-IITISoC) project is organized to support cross-platform development, modularity, and ease of maintenance. Here’s an updated breakdown of the main files and folders based on the repository structure:

| File/Folder         | Purpose                                                        |
|---------------------|----------------------------------------------------------------|
| `.vscode/`          | Visual Studio Code workspace settings                          |
| `android/`          | Android platform-specific code                                 |
| `assets/`           | Static assets (images, audio files, etc.)                      |
| `ios/`              | iOS platform-specific code                                     |
| `lib/`              | Main Flutter/Dart source code (UI, logic, features)            |
| `linux/`            | Linux platform-specific code                                   |
| `macos/`            | macOS platform-specific code                                   |
| `test/`             | Unit and widget tests                                          |
| `web/`              | Web platform-specific code                                     |
| `windows/`          | Windows platform-specific code                                 |
| `.gitignore`        | Specifies files and folders to be ignored by Git               |
| `.metadata`         | Flutter project metadata                                       |
| `Backend`           | Backend-related scripts or configuration                       |
| `Frontend`          | Frontend-related scripts or configuration                      |
| `LICENSE`           | Project license (add if you wish to open source)               |
| `README.md`         | Project documentation                                          |
| `analysis_options.yaml` | Dart analysis and linting rules                           |
| `firebase.json`     | Firebase configuration                                         |
| `pubspec.lock`      | Locked versions of dependencies                                |
| `pubspec.yaml`      | Flutter dependencies and project configuration                 |

### `lib/` Directory Structure

Within the `lib/` folder, the code is further organized by feature and functionality:

| Subfolder/File            | Purpose                                               |
|---------------------------|------------------------------------------------------|
| `ai/`                     | AI-related features (e.g., chatbot, recommendations) |
| `music/`                  | Music playback and management logic                  |
| `musicmain/`              | Main music player logic and UI                       |
| `radiofront/`             | Radio streaming frontend                             |
| `redundant/`              | Deprecated or backup code                            |
| `screens/`                | UI screens and navigation                            |
| `services/`               | Service classes (API, data, etc.)                    |
| `settings/`               | User and app settings                                |
| `widgets/`                | Reusable UI components                               |
| Dart files (e.g., `main.dart`, `app_drawer.dart`, etc.) | App entry point and core widgets |

This structure supports a scalable, maintainable, and cross-platform codebase, making it easier for teams to collaborate and extend the app’s functionality.

## Customization

- **Add New Features:**  
  The modular codebase makes it easy to extend functionality.
- **UI Themes:**  
  Modify Lottie files or styles for a personalized look.
- **Music Sources:**  
  Integrate additional APIs or radio stations as desired.

## Contributing

Contributions are welcome! If you have ideas for new features, improvements, or bug fixes, feel free to fork the repository and submit a pull request. Please ensure your code is clean and well-documented to help others understand your changes.

## License

This project is open source and available under the MIT License.
