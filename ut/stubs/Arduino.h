
#pragma once

//#include <assert.h>
#include "gtest/gtest.h"
#include <cstdint>

#include "TinyDebugSerial.h"

typedef char byte;

static constexpr unsigned LOW = 0;
static constexpr unsigned HIGH = 1;
static constexpr unsigned OUTPUT = 2;
static constexpr unsigned INPUT = 3;
static constexpr unsigned RISING = 4;

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

extern TinyDebugSerial Serial;

#define PI 3.1415926535897932384626433832795

