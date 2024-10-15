2#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>

// Set these to run the example
#define FIREBASE_HOST "https://appf-df050-default-rtdb.asia-southeast1.firebasedatabase.app"  // e.g. example.firebaseio.com
#define FIREBASE_AUTH "UMfsRLL0vqYFeZhJa51O2GLLYHE4L9UfkuIfPhCW"  // Firebase database secret
#define WIFI_SSID "Galaxy"
#define WIFI_PASSWORD "71390227"

int led = D4;     // LED pin
int button = D3;  // push button is connected
int buttonState = 0;     // current state of the button
int lastButtonState = 0; // previous state of the button
int pressCount = 0;      // count of button presses

FirebaseData firebaseData;

void setup() {
  pinMode(led, OUTPUT);   // declare LED as output
  pinMode(button, INPUT); // declare push button as input
  Serial.begin(9600);

  // Connect to WiFi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to ");
  Serial.print(WIFI_SSID);
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("Connected to ");
  Serial.println(WIFI_SSID);

  // Connect to Firebase
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

void loop() {
  // read the push button input pin
  buttonState = digitalRead(button);

  // compare the buttonState to its previous state
  if (buttonState != lastButtonState) {
    // if the state has changed, increment the counter
    if (buttonState == HIGH) {
      // if the current state is HIGH then the button
      // went from off to on:
      pressCount++;
      Serial.println("Button pressed");
      Serial.print("Press count: ");
      Serial.println(pressCount);

      // Update the button press count in Firebase
      if (Firebase.setInt(firebaseData, "/buttonPressCount", pressCount)) {
        Serial.println("Firebase data updated successfully!");
      } else {
        Serial.print("Error updating Firebase data: ");
        Serial.println(firebaseData.errorReason());
      }
    }
    // Delay a little bit to avoid bouncing
    delay(50);
  }
  // save the current state as the last state
  lastButtonState = buttonState;

  // Toggle LED based on button state
  if (buttonState == HIGH) {
    digitalWrite(led, HIGH);
  } else {
    digitalWrite(led, LOW);
  }

  delay(10);
}
