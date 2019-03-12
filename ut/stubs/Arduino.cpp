#include "Arduino.h"

#include <string.h>

unsigned pins[Arduino::numPins] = {LOW};
unsigned Arduino::ledState(unsigned const pin)
{
    assert(pin < numPins);
    return ::pins[pin];
}
void Arduino::reset()
{
    memset(&pins, LOW, sizeof(pins));
    timeNow = 0;
}
void pinMode(const int pin, const int mode)
{

}
void digitalWrite(unsigned pin, unsigned state)
{
    assert(pin < Arduino::numPins);
    pins[pin] = state;
    if (receivedEvents.on())
    {
    	receivedEvents.add(PinEvent(pin, state, Arduino::timeNow));
    }
}
unsigned digitalRead(unsigned pin)
{
    return 0;
}
void attachInterrupt(uint8_t, void (*)(void), int mode)
{

}
unsigned long millis()
{
    Arduino::timeNow += Arduino::timeStep;
    return Arduino::timeNow;
}
unsigned long micros()
{
    return millis()*1000;
}
void delay(int const milliSecs)
{
	Arduino::timeNow += milliSecs;
}
unsigned long Arduino::timeNow = 0;
unsigned long Arduino::timeStep = 1;

//TinyDebugSerial Serial;
