#include <iostream>

using namespace std;

const int n = 2;
const int nn = 4;
struct page;

struct item
{
    long int key;
    long int count;
    page *p;
};

struct page
{
    int m;
    page *p0;
    item *e[nn + 1];
};

//=========  ПОИСК КЛЮЧА Х В Б-ДЕРЕВЕ =======================
void search(long int x, page *a, bool &h, item *&v)
{
    long int k, L, r, i;
    page *q, *b;
    item *u = NULL;

    // поиск ключа х на странице a; h-false. Если h истинно, то параметр u представляет передаваемый вверх по дереву элемент
    if (a == NULL)
    {
        /**
         * элемента с ключем х нет в дереве.
         * Находимся на самом нижнем уровне – уровне листьев В-дерева. Создаем запись v -  типа item
         */
        v = new item;
        (*v).key = x;
        (*v).count = 1;
        (*v).p = NULL;
        h = true;
    }
    else
    {
        /**
         * Находимся на внутренней (не лист) вершине В-дерева.
         * Выполняем двоичный поиск и определяем куда идти дальше.
         */
        L = 1;
        r = (*a).m;
        while (!(r < L))
        {
            k = (L + r) / 2;
            if (x <= (*(*a).e[k]).key)
            {
                r = k - 1;
            }
            if (x >= (*(*a).e[k]).key)
            {
                L = k + 1;
            }
        }
        if ((L - r) > 1)
        {
            (*(*a).e[k]).count++;
            h = false;
        }
        else
        {
            if (r == 0)
            {
                q = (*a).p0;
            }
            else
            {
                q = (*(*a).e[r]).p;
            }
            search(x, q, h, u);
        }
        if (h)
        {
            if ((*a).m < nn)
            {
                (*a).m++;
                h = false;
                for (i = (*a).m; i >= (r + 2); i--)
                {
                    (*a).e[i] = (*a).e[i - 1];
                }
                (*a).e[r + 1] = u;
            }
            else
            {
                b = new page;
                if (r <= n)
                {
                    if (r == n)
                    {
                        v = u;
                    }
                    else
                    {
                        v = (*a).e[n];
                        for (i = n; i >= r + 2; i--)
                        {
                            (*a).e[i] = (*a).e[i - 1];
                        }
                        (*a).e[r + 1] = u;
                    }
                    for (i = 1; i <= n; i++)
                    {
                        (*b).e[i] = (*a).e[i + n];
                    }
                }
                else
                {
                    r -= n;
                    v = (*a).e[n + 1];
                    for (i = 1; i <= r - 1; i++)
                    {
                        (*b).e[i] = (*a).e[i + n + 1];
                    }
                    (*b).e[r] = u;
                    for (i = r + 1; i <= n; i++)
                    {
                        (*b).e[i] = (*a).e[i + n];
                    }
                }
                (*a).m = n;
                (*b).m = n;
                (*b).p0 = (*v).p;
                (*v).p = b;
            }
        }
    }
}

void printtree(page *p, long int L)
{
    long int i;
    if (p != NULL)
    {
        cout << "m=" << ((*p).m);
        for (i = 1; i <= L; i++)
        {
            cout << " ";
        }

        for (i = 1; i <= (*p).m; i++)
        {
            cout << (*(*p).e[i]).key << " ";
        }
        cout << endl;
        printtree((*p).p0, L + 1);
        for (i = 1; i <= (*p).m; i++)
        {
            printtree((*(*p).e[i]).p, L + 1);
        }
    }
}

int main()
{
    page *root, *q;
    long int x;
    bool h;
    item *u;
    root = NULL;
    cout << "Enter key: ";
    cin >> x;
    while (x != 0)
    {
        search(x, root, h, u);
        // cout << "h=" << h << endl;
        if (h)
        {
            q = root;
            root = new page;
            (*root).m = 1;
            (*root).p0 = q;
            (*root).e[1] = u;
        }
        cout << "B-tree: " << endl;
        printtree(root, 1);
        cout << "Enter key: ";
        cin >> x;
    }
    return 0;
}