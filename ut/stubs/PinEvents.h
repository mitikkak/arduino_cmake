
#pragma once

#include <vector>

class PinEvent
{
public:
	PinEvent(const int pin, const int state, const int startTime)
    : pin_{pin}, state_{state}, startTime_{startTime}
    {}
    int pin() const { return pin_; }
    int state() const { return state_; }
    int startTime() const { return startTime_; }
private:
	const int pin_;
	const int state_;
	const int startTime_;
};

class ReceivedEvents
{
public:
	ReceivedEvents();
	void start();
	void stop();
	bool on() { return started; }
	void add(const PinEvent& evt);
	int size() const { return receivedEvents.size(); }
	const PinEvent& operator[](const int) const;
	void verify(std::vector<PinEvent>& expectedEvents) const;
private:
	std::vector<PinEvent> receivedEvents;
	bool started;
};

extern ReceivedEvents receivedEvents;
