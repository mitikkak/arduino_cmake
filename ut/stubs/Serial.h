
class SerialStub
{
public:
    void begin(const int rate) const;
    void println(const char*, const unsigned = 0) const;
    void println(const char, const unsigned = 0) const;
    void print(const char*, const unsigned = 0) const;
    void print(const char, const unsigned = 0) const;
    void end() const;
    char read() const;

};

extern SerialStub Serial;
