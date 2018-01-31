
struct Wire_t
{
 void begin() const;
 void beginTransmission(int) const;
 void beginTransmission(char) const;
 void write(byte reg_addr) const;
 int write(byte* const buffer, int const nbytes) const;
 char endTransmission() const;
 char endTransmission(const int) const;
 void requestFrom(int, int) const;
 bool available() const;
 byte read() const;
};

extern Wire_t Wire;
