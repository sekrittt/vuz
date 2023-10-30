#ifndef BUNDLE_H // include guard
#define BUNDLE_H
#include <iostream>
#include <map>

class Bundle
{
public:
    Bundle() {}
    std::string getString(std::string name)
    {
        return dataString[name];
    }
    void addString(std::string name, std::string value)
    {
        dataString[name] = value;
    }
    bool removeString(std::string name)
    {
        if (dataString.count(name) == 0)
        {
            return false;
        }
        dataString.erase(name);
        return true;
    }

    int getInt(std::string name)
    {
        return dataInt[name];
    }
    void addInt(std::string name, const int *value)
    {
        dataInt[name] = *value;
    }
    bool removeInt(std::string name)
    {
        if (dataInt.count(name) == 0)
        {
            return false;
        }
        dataInt.erase(name);
        return true;
    }

protected:
    std::map<std::string, int> dataInt{};
    std::map<std::string, std::string> dataString{};
};

#endif
