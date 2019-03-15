
#include "Serial.h"

void SerialStub::begin(const int rate) const
{
}
void SerialStub::println(const char*, const unsigned) const
{
}
void SerialStub::println(const char, const unsigned) const
{
}
void SerialStub::print(const char*, const unsigned) const
{
}
void SerialStub::print(const char,const unsigned) const
{
}
char SerialStub::read() const
{
}

SerialStub Serial;
