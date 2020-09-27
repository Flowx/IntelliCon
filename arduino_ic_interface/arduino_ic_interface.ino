
#define PHRASE "$$$INTELLICON$$$"

int timeout = 6; // in seconds
unsigned long lastMsg = 0;
bool isConnected = false;



void setup() {
  Serial.begin(115200);

  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
    if(!isConnected) return;

    Serial.println();
    Serial.println(millis()/1000);
    Serial.println(lastMsg);

    if( (millis()/1000) > lastMsg ) {
      // timeout!
      Serial.print(PHRASE);
      if(!Serial.find(PHRASE))
      {
        isConnected = false;
        Serial.flush();
        digitalWrite(LED_BUILTIN, LOW);
        return;
      }
    }
}

void serialEvent() {
  if(isConnected) { // parse the IC Frames here
    
  } else {
    if(Serial.find(PHRASE)) { // thats us!
      Serial.flush();
      isConnected = true;
      digitalWrite(LED_BUILTIN, HIGH);
      lastMsg = (millis()/1000) + timeout;
      return;
    }
    digitalWrite(LED_BUILTIN, LOW);
  }
}
