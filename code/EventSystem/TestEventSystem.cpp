#include <iostream>
#include "EventSystem.cpp"

using namespace std;

class NetEvent : virtual public Event
{
public:
    NetEvent(string t, string _message) : Event(t)
    {
        this->message = _message;
    }
    string message;
};

bool onNetOpen(NetEvent &e)
{
    cout << "Oh, it's work..." << endl;
    cout << e.message << endl;
    return true;
}

int main()
{
    EventHandler<NetEvent> EH1 = {"net-open", onNetOpen};
    NetEvent netEvent = {"net-open", "Connection success"};
    Event e = {"test"};
    EventTarget<NetEvent> ET;

    EventHandlerRegistered EHR_onNetOpen1 = ET.on(EH1);

    ET.dispatchEvent(netEvent);
    return 0;
}
