#include <assert.h>
#include <string.h>

size_t my_strlen(char *in)
{
	if (!in)
		return 0;

	size_t count = 0;

	while (*in) {
		count++;
		in++;
	}

	return count;
}

/*
 * Unit tests.
 */
void test_my_strlen()
{
    char str1[] = "Hello world";
    char str2[] = "";

    assert(my_strlen(str1) == strlen(str1));
    assert(my_strlen(str2) == strlen(str2));
}

int main()
{
    test_my_strlen();

    return 0;
}
