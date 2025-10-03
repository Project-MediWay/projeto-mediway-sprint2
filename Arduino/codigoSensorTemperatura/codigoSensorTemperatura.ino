// Começo do bloco de declaração de variávies
const int PINO_SENSOR_TEMPERATURA = A0;
float temperatura;
// Término do bloco


// Começo do bloco de configuração de transmissão de dados entre computador e arduino.
void setup() {
Serial.begin(9600);
}
// Término do bloco


// Começo do bloco de execução de captura dos dados e execução de cálculos 
void loop() {
int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA);

temperatura = (valorLeitura * 0.00488);
temperatura = temperatura * 100;

Serial.println(temperatura);

delay(2000);
}
// Término do bloco




