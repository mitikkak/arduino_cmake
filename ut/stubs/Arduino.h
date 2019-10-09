
#pragma once

//#include <assert.h>
#include "gtest/gtest.h"
#include <cstdint>
#include <math.h>
//#include "TinyDebugSerial.h"
#include "Serial.h"
#include "PinEvents.h"

typedef char byte;

static constexpr unsigned LOW = 0;
static constexpr unsigned HIGH = 1;
static constexpr unsigned OUTPUT = 2;
static constexpr unsigned INPUT = 3;
static constexpr unsigned RISING = 4;
static constexpr unsigned INPUT_PULLUP = 5;

static constexpr unsigned LED_BUILTIN = 13;
namespace Arduino {

static constexpr unsigned numPins = 14;
extern unsigned ledState(unsigned const pin);
extern void reset();
extern unsigned long timeNow;
extern unsigned long timeStep;
}

extern void pinMode(const int pin, const int mode);
extern void digitalWrite(unsigned pin, unsigned state);
extern unsigned digitalRead(unsigned pin);
extern void attachInterrupt(uint8_t, void (*)(void), int mode);
extern unsigned long millis();
extern unsigned long micros();
extern void delay(int const);

#ifndef F
#define F
#endif
#define PROGMEM
//extern TinyDebugSerial Serial;

#define PI 3.1415926535897932384626433832795
#define TWO_PI 6.283185307179586476925286766559

#define DEG_TO_RAD 0.017453292519943295769236907684886
#define radians(deg) ((deg)*DEG_TO_RAD)

#define RAD_TO_DEG 57.295779513082320876798154814105
#define degrees(rad) ((rad)*RAD_TO_DEG)

#define sq(x) ((x)*(x))
