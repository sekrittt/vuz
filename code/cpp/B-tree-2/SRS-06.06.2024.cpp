#include <iostream>
#include <fstream>

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

void readFromFile(page *&root, string fileName)
{
    ifstream file(fileName);
    int num;
    bool h;
    item *u;
    page *q;
    while (file >> num)
    {
        search(num, root, h, u);
        if (h)
        {
            q = root;
            root = new page;
            (*root).m = 1;
            (*root).p0 = q;
            (*root).e[1] = u;
        }
    }
}

void underflow(page *c, page *a, int s, bool &h)
{
    page *b;
    int i, k, mb, mc;
    mc = (*c).m;
    if (s < mc)
    {
        s++;
        b = (*(*c).e[s]).p;
        mb = (*b).m;
        k = (mb - n + 1) / 2;
        (*a).e[n] = (*c).e[s];
        (*(*a).e[n]).p = (*b).p0;
        if (k > 0)
        {
            for (i = 1; i <= k - 1; i++)
            {
                (*a).e[i + n] = (*b).e[i];
            }
            (*c).e[s] = (*b).e[k];
            (*(*c).e[s]).p = b;
            (*b).p0 = (*(*b).e[k]).p;
            mb -= k;
            for (i = 1; i <= mb; i++)
            {
                (*b).e[i] = (*b).e[i + k];
            }
            (*b).m = mb;
            (*a).m = n - 1 + k;
            h = false;
        }
        else
        {
            for (i = 1; i <= n; i++)
            {
                (*a).e[i + n] = (*b).e[i];
            }
            for (i = s; i <= mc - 1; i++)
            {
                (*c).e[i] = (*c).e[i + 1];
            }
            (*a).m = nn;
            (*c).m = mc - 1;
            h = (*c).m < n;
        }
    }
    else
    {
        if (s == 1)
        {
            b = (*c).p0;
        }
        else
        {
            b = (*(*c).e[s - 1]).p;
        }
        mb = (*b).m + 1;
        k = (mb - n) / 2;
        if (k > 0)
        {
            for (i = n - 1; i >= 1; i--)
            {
                (*a).e[i + k] = (*a).e[i];
            }
            (*a).e[k] = (*c).e[s];
            (*(*a).e[k]).p = (*a).p0;
            mb -= k;
            for (i = k - 1; i >= 1; i--)
            {
                (*a).e[i] = (*b).e[i + mb];
            }
            (*a).p0 = (*(*b).e[mb]).p;
            (*c).e[s] = (*b).e[mb];
            (*(*c).e[s]).p = a;
            (*b).m = mb - 1;
            (*a).m = n - 1 + k;
            h = false;
        }
        else
        {
            (*b).e[mb] = (*c).e[s];
            (*(*b).e[mb]).p = (*a).p0;
            for (i = 1; i <= n - 1; i++)
            {
                (*b).e[i + mb] = (*a).e[i];
            }
            (*b).m = nn;
            (*c).m = mc - 1;
            h = (*c).m < n;
        }
    }
}
void del(page *p, bool &h, page *a, int k)
{
    page *q;
    q = (*(*p).e[(*p).m]).p;
    if (q != NULL)
    {
        del(q, h, a, k);
        if (h)
        {
            underflow(p, q, (*p).m, h);
        }
    }
    else
    {
        (*(*p).e[(*p).m]).p = (*(*a).e[k]).p;
        (*a).e[k] = (*p).e[(*p).m];
        (*p).m--;
        h = (*p).m < n;
    }
}

void _delete(int x, page *a, bool &h)
{
    int i, k, l, r;
    page *q;
    if (a == NULL)
    {
        cout << "Key is not in tree" << endl;
        h = false;
    }
    else
    {
        l = 1;
        r = (*a).m;
        do
        {
            k = (l + r) / 2;
            if (x <= (*(*a).e[k]).key)
            {
                r = k - 1;
            }
            if (x >= (*(*a).e[k]).key)
            {
                l = k + 1;
            }
        } while (!(l > r));
        if (r == 0)
        {
            q = (*a).p0;
        }
        else
        {
            q = (*(*a).e[r]).p;
        }
        if (l - r > 1)
        {
            if (q == NULL)
            {
                (*a).m--;
                h = (*a).m < n;
                for (i = k; i <= (*a).m; i++)
                {
                    (*a).e[i] = (*a).e[i + 1];
                }
            }
            else
            {
                del(q, h, a, k);
                if (h)
                {
                    underflow(a, q, r, h);
                }
            }
        }
        else
        {
            _delete(x, q, h);
            if (h)
            {
                underflow(a, q, r, h);
            }
        }
    }
}

int main()
{
    page *root, *q;
    bool h;
    root = NULL;
    readFromFile(root, "file.txt");
    printtree(root, 1);
    int x;
    cout << "Enter element to delete: ";
    cin >> x;
    _delete(x, root, h);
    if (h)
    {
        if ((*root).m == 0)
        {
            q = root;
            root = (*q).p0;
        }
    }
    printtree(root, 1);
    return 0;
}