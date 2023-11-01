#include <iostream>
#include <GL/glut.h>

float x, y, h0 = 896, delta;
int n;


void A(int n);
void B(int n);
void C(int n);
void D(int n);

void LineTo(float nx, float ny)
{
	GLfloat vertices[] = {x, y, nx, ny};
	glEnableClientState(GL_VERTEX_ARRAY);
	glVertexPointer(2, GL_FLOAT, 0, vertices);
    	glDrawArrays(GL_LINE_LOOP, 0, 2);
    	glDisableClientState(GL_VERTEX_ARRAY);
	glFlush();
}


void A(int n)
{
	if (n > 0)
	{
		D(n-1); LineTo(x - delta, y); x -= delta;
		A(n-1); LineTo(x, y - delta); y -= delta;
		A(n-1); LineTo(x + delta, y); x += delta;
		B(n-1);
	}
}


void B(int n)
{
	if (n > 0)
	{
		C(n-1); LineTo(x, y + delta); y += delta;
		B(n-1); LineTo(x + delta, y); x += delta;
		B(n-1); LineTo(x, y - delta); y -= delta;
		A(n-1);
	}
}


void C(int n)
{
	if (n > 0)
	{
		B(n-1); LineTo(x + delta, y); x += delta;
		C(n-1); LineTo(x, y + delta); y += delta;
		C(n-1); LineTo(x - delta, y); x -= delta;
		D(n-1);
	}
}


void D(int n)
{
	if (n > 0)
	{
		A(n-1); LineTo(x, y - delta); y -= delta;
		D(n-1); LineTo(x - delta, y); x -= delta;
		D(n-1); LineTo(x, y + delta); y += delta;
		C(n-1);
	}
}


void displayMe()
{
    glClear(GL_COLOR_BUFFER_BIT);

    // Initialize OpenGL context and set up the viewport and projection matrices
    int width = glutGet(GLUT_WINDOW_WIDTH);
    int height = glutGet(GLUT_WINDOW_HEIGHT);
    glViewport(-225, -50, width*1.25, height*1.25);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, width*1.25, height*1.25, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    // Define the vertices of the line
    do
    {
        n++;
        delta = delta/2;
        A(n);
        h0 += delta/4;
        x = h0;
        y = h0;
    } while (n < 10);
}

int main(int argc, char** argv)
{
    glutInit(&argc, argv);
    x = h0;
    y = h0;
    delta = h0;
    n = 0;
    glutInitDisplayMode(GLUT_SINGLE);
    glutInitWindowSize(1280, 1000);
    glutInitWindowPosition(0, 0);
    glutCreateWindow("OpenGL");
    glutDisplayFunc(displayMe);
    glutMainLoop();
    return 0;
}
