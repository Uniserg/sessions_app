# Flutter Sessions Tracker

## Overview
Flutter Sessions Tracker is a cross-platform Flutter application designed to help users track and manage sessions efficiently. The application provides an intuitive interface for viewing active sessions and deleting them as needed. The backend server is implemented using Python, making it a lightweight and versatile solution for session management.

## Features
- **Session Tracking**: View all active sessions in a single interface.
- **Session Management**: Delete individual sessions to maintain control and security.
- **Cross-Platform Compatibility**: Runs seamlessly on iOS, Android, web, and desktop platforms.
- **Single Page Application (SPA)**: Delivers a smooth user experience by minimizing page reloads.

## Requirements
To build and run this project, the following dependencies and environments are required:

### Flutter
- Version: `3.19`
- Install Flutter from [flutter.dev](https://flutter.dev) and ensure it is added to your PATH.

### Python
- Version: `3.12`
- Install Python from [python.org](https://www.python.org/downloads/).

### Additional Tools
- Git
- IDE (e.g., VS Code, Android Studio, or IntelliJ IDEA)

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/flutter-sessions-tracker.git
   cd flutter-sessions-tracker
   ```
2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

## Usage
### Build and Run for Web
1. Build the project for the web platform:
   ```bash
   flutter build web
   ```
2. Navigate to the compiled files directory:
   ```bash
   cd build/web
   ```
3. Start a local server:
   ```bash
   python3 -m http.server 8000
   ```

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your improvements or new features.

## License
The MIT License (MIT)

Copyright (c) 2025 Sergei Tkachev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.