#include <iostream>
#include <fstream>

using namespace std;

void print_array(int M[], int len)
{
    cout << "{";
    for (int i = 0; i < len; i++)
    {
        cout << M[i];
        if (i < len - 1)
            cout << ", ";
    }
    cout << "}" << endl;
}

// Function to read elements of the array from a text file
void fillArrayFromFile(int arr[], int n)
{
    ifstream file("file.txt");
    for (int i = 0; i < n; ++i)
    {
        file >> arr[i];
    }
    file.close();
}

// Function to calculate the average of the elements in the array
double calculateAverage(int arr[], int n)
{
    int sum = 0;
    for (int i = 0; i < n; ++i)
    {
        sum += arr[i];
    }
    return static_cast<double>(sum) / n;
}

void add_numbers(int &newSize, int minElement, int *arr, int k)
{
    for (int i = 0; i < newSize; i++)
    {
        if (arr[i] == minElement)
        {
            for (int j = newSize; j > i; j--)
            {
                arr[j] = arr[j - 1];
            }
            arr[i + 1] = k;
            newSize++;
            break;
        }
    }
}

void remove_elements(int &newSize, int n, double average, int *arr)
{
    for (int i = 0; i < n; ++i)
    {
        if (arr[i] >= average)
        {
            arr[newSize++] = arr[i];
        }
    }
}

int min(int arr[], int n)
{
    int m = arr[0];
    for (int i = 1; i < n; i++)
    {
        if (arr[i] < m)
        {
            m = arr[i];
        }
    }
    return m;
}

int main()
{
    int n, k;
    cout << "Enter the number of elements in the array: ";
    cin >> n;

    int arr[n];
    fillArrayFromFile(arr, n);
    cout << "Original array: ";
    print_array(arr, n);
    // Calculate the average of the elements
    double average = calculateAverage(arr, n);

    // Remove elements less than the average
    int newSize = 0;
    remove_elements(newSize, n, average, arr);
    cout << "Modified (without elements less than the average) array: ";
    print_array(arr, newSize);

    // Find the minimum element
    int minElement = min(arr, newSize);

    // Add a number after the minimum element
    cout << "Enter the number to add after the minimum element: ";
    cin >> k;
    add_numbers(newSize, minElement, arr, k);

    // Display the arrays
    cout << "Result array: ";
    print_array(arr, newSize);

    return 0;
}
/*
Enter the number of elements in the array: 10
Original array: {124, 12, 44, 98, 75, 23, 82, 776, 32, 43}
Modified (without elements less than the average) array: {776}
Enter the number to add after the minimum element: 40
Result array: {776, 40}

Enter the number of elements in the array: 10
Original array: {124, 12, 44, 98, 75, 23, 82, 776, 32, 43}
Modified (without elements less than the average) array: {776}
Enter the number to add after the minimum element: 1234
Result array: {776, 1234}
*/
