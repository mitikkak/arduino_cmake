
#include "PinEvents.h"
#include <cassert>
#include <gtest/gtest.h>

ReceivedEvents receivedEvents;

ReceivedEvents::ReceivedEvents()
: started{false}
{}

void ReceivedEvents::add(const PinEvent& evt)
{
	receivedEvents.push_back(evt);
}
void ReceivedEvents::start()
{
	receivedEvents.clear();
	started = true;
}
void ReceivedEvents::stop()
{
	started = false;
}
const PinEvent& ReceivedEvents::operator[](const int idx) const
{
	assert(idx < receivedEvents.size());
	return receivedEvents[idx];
}
void ReceivedEvents::verify(std::vector<PinEvent>& expectedEvents) const
{
	ASSERT_EQ(expectedEvents.size(), receivedEvents.size());
	for (int i = 0; i < expectedEvents.size(); i++)
	{
		const PinEvent& rcvEvt = receivedEvents[i];
		const PinEvent& expEvt = expectedEvents[i];
//		printf("[%d] rcvEvt [%d,%d,%d] expEvt [%d,%d,%d] \n", i, rcvEvt.pin(), rcvEvt.state(), rcvEvt.startTime(), expEvt.pin(), expEvt.state(), expEvt.startTime());
		ASSERT_EQ(expEvt.pin(), rcvEvt.pin()) << "Pin differs at " << i;
		ASSERT_EQ(expEvt.state(), rcvEvt.state()) << "State differs at " << i;
		ASSERT_EQ(expEvt.startTime(), rcvEvt.startTime()) << "StartTime differs at " << i;
	}
}
