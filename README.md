# Evergreen: Plant Disease Detection Mobile App

Evergreen is a mobile application designed to assist users in identifying and diagnosing plant diseases through image recognition technology. By leveraging a TensorFlow Lite model, the app analyzes images of plant leaves and provides diagnostic information, helping users maintain the health of their crops.

## Features

- **Image Recognition:** Users can upload images of plant leaves to the app for analysis.
- **Disease Diagnosis:** Evergreen classifies the uploaded images and provides information about any detected plant diseases.
- **Intuitive Interface:** The app features a user-friendly interface, making it accessible for users of all skill levels.
- **Real-Time Results:** Users receive instant feedback on the health of their plants, allowing for prompt action to be taken if necessary.

## Why Evergreen?

Evergreen is a valuable tool for both hobbyist gardeners and professional farmers alike. Here's why it's useful in real-life scenarios:

1. **Early Disease Detection:** By identifying plant diseases early, users can take proactive measures to prevent the spread of infections and minimize crop damage.
2. **Improved Crop Management:** With Evergreen, users can make informed decisions about crop treatment and management practices, leading to healthier and more productive plants.
3. **Convenient and Accessible:** The mobile app format makes it easy for users to access diagnostic tools wherever they are, whether they're in the garden or out in the field.

## File Structure

The project directory is organized as follows:

.
Evergreen/
│
├── assets/
│ ├── apple_leaves.jpg
│ ├── orange_leaves.jpg
│ ├── cherry_leaves.jpg
│ ├── lemon_leaves.jpg
│ ├── tree_bg.jpg
│ └── dl_model/
│ ├── tflite_model.tflite
│ └── labels.txt
│
├── lib/
│ ├── components/
│ │ └── button.dart
│ │
│ ├── screens/
│ │ ├── home_screen.dart
│ │ ├── login_screen.dart
│ │ ├── scanned_images_screen.dart
│ │ ├── second_screen.dart
│ │ ├── selected_images_screen.dart
│ │ ├── signup_screen.dart
│ │ └── start_screen.dart
│ │
│ ├── model.dart
│ └── main.dart
│
└── pubspec.yaml


## How to Use

1. **Installation:** Clone the repository to your local machine.
2. **Dependencies:** Ensure you have Flutter installed on your machine.
3. **Run the App:** Navigate to the project directory and run `flutter run` to launch the app on your device or emulator.

## Contributing

Contributions to Evergreen are welcome! If you'd like to contribute, please fork the repository and submit a pull request with your changes.

## Contact

For any inquiries or support, please contact:
- **Email:** ffathy2004@gmail.com
