
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
	printf("ReceivedEvents::start %ld \n", receivedEvents.size());
	receivedEvents.clear();
	printf("ReceivedEvents::start %ld \n", receivedEvents.size());
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
		EXPECT_EQ(expEvt.pin(), rcvEvt.pin());
		EXPECT_EQ(expEvt.state(), rcvEvt.state());
		EXPECT_EQ(expEvt.startTime(), rcvEvt.startTime());
	}
}
