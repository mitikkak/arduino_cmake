
#pragma once

#include <string>
typedef std::string String;
class SerialStub
{
public:
    void begin(const int rate) const;
    void println(const char*, const unsigned = 0) const;
    void println() const;
    void println(const String&) const;
    void println(const char, const unsigned = 0) const;
    void print(const char*, const unsigned = 0) const;
    void print(const char, const unsigned = 0) const;
    void write(const char) const;
    void end() const;
    char read() const;

};

extern SerialStub Serial;
