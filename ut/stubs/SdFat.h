
#pragma once

class SdFat
{
public:
	bool begin(const int ) { return true; }

};

class ofstream
{
public:
	ofstream(const char* const&) {}
	void close() const {}
	ofstream& operator<<(const char* const)
	{
		return *this;
	}

};

class ifstream
{
public:
	ifstream(const char* const&) {}
	int rdstate() const { return 0;}
	void close() const {}
	bool fail() const { return false; }
	bool good() const { return true; }
};

#define F(str) str
