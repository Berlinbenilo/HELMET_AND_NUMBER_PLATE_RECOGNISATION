
void setup() {
    Serial.begin(9600);
  
}


void loop() {
  Serial.println("AT\r");        
  delay(1000);
  Serial.println("AT+CMGF=1\r"); 
  delay(1000);
  Serial.println("AT+CMGS=\"+916380181081\"\r");   
  delay(1000);  
  Serial.println("CHILD AT LOCATION"); 
  delay(1000);
  Serial.println((char)26);    
  delay(100);

}
