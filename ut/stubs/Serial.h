
class SerialStub
{
public:
    void begin(const int rate) const;
    void println(const char*) const;
    void println(const char) const;
    void print(const char*) const;
    void print(const char) const;
    char read() const;

};

extern SerialStub Serial;
