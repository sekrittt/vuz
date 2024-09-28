#include <iostream>
#include <map>
#include <functional>

#include "Bundle.h"

using namespace std;

class Event : virtual public Bundle
{
public:
    Event(string t) : Bundle()
    {
        this->type = t;
    }
    ~Event() {}
    string type;
};

template <typename T>
class EventHandler
{
public:
    EventHandler(string t, bool (*h)(T &), bool o)
    {
        this->type = t;
        this->handler = h;
        this->once = o;
    }
    EventHandler(string t, bool (*h)(T &))
    {
        this->type = t;
        this->handler = h;
        this->once = false;
    }
    EventHandler() {}
    string type;
    bool (*handler)(T &);
    bool once;
};

class EventHandlerRegistered
{
public:
    EventHandlerRegistered(std::function<bool()> _off)
    {
        this->off = _off;
    }
    std::function<bool()> off;
};

template <typename T>
class EventTarget
{
public:
    EventTarget() {}
    EventHandlerRegistered on(EventHandler<T> eh)
    {
        int id = this->handlersId.count(eh.type) == 1 ? this->handlersId[eh.type] + 1 : 1;
        this->handlersId[eh.type] = id;
        if (this->handlers.count(eh.type) == 0)
        {
            this->handlers[eh.type] = {};
        }
        this->handlers[eh.type][id] = eh;

        auto off = [eh, id, this]()
        {
            if (this->handlers.count(eh.type) == 1 && this->handlers[eh.type].count(id) == 1)
            {
                this->handlers[eh.type].erase(id);
                return true;
            }
            return false;
        };
        EventHandlerRegistered EHR = {off};
        return EHR;
    }
    bool dispatchEvent(T e)
    {
        for (const auto &[id, eh] : this->handlers[e.type])
        {
            if (!eh.handler(e))
            {
                return false;
            }
        }
        return true;
    }
    map<string, map<int, EventHandler<T>>> handlers{};
    map<string, int> handlersId{};
};
