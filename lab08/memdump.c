#include <stdio.h>
#include <string.h>
#include <stdlib.h>
struct X{
  char a;
  int i;
  char b;
  int *p;
};

struct tree_node
{
    char *str;
    struct tree_node *left;
    struct tree_node *right;
};

void memdump(char * p , int len) {
/***
 * memdump: dump memory in bytes and in ascii code.
 * Example of dump:
 * 0xbeab36e0: 41 76 00 40 09 00 00 00 30 00 00 00 e4 36 ab be Av.@....0....6.. 
 * 0xbeab36f0: 00 00 00 00 00 00 28 40 48 65 6c 6c 6f 20 77 6f ......(@Hello wo
 *
 * Argument:
 *  p: the pointer to the target memory
 *  len: the length of dump output
 *
 ***/
    printf("0x%p: ", (unsigned long) p);
    for (int i = 0; i < len; i++) {
        printf("%02hhx ", p[i]&0xFF);
        if (((i + 1) % 16) == 0) {
            printf(" ");
            for (int j = (i - 15); j <= i; j++) {
                if (((p[j]&0xFF) <= 127) && ((p[j]&0xFF) >= 32))
                    printf("%c", p[j]&0xFF);
                else
                    printf(".");
            }
            printf("\n");
            if ((i + 1) < len)
                printf("0x%p: ", (unsigned long) (p + i + 1));
        }
        else if (((len % 16) != 0) && !((i+1) < len)) {
            for (int j = 0; j < (3 * (16 - (len % 16))) + 1; j++)
                printf(" ");
            for (int j = (i - (len % 16) + 1); j <= i; j++) {
                if (((p[j]&0xFF) <= 127) && ((p[j]&0xFF) >= 32))
                    printf("%c", p[j]&0xFF);
                else
                    printf(".");
            }
            printf("\n");
        }
    }
}

struct tree_node *create_tree_node(char *str, struct tree_node *left, struct tree_node *right)
/***
 * create_tree_node: wrapper function for creating tree_node
 * 
 * You don't need to modify this part
 *
 * Argument:
 *  root: pointer to struct tree_node
 *
 ***/
{
    struct tree_node *node = malloc(sizeof(struct tree_node));
    node->str = str;
    node->left = left;
    node->right = right;

    return node;
}

void free_tree(struct tree_node *root)
/***
 * free_tree: free allocated tree_node recursively
 * 
 * You don't need to modify this part
 *
 * Argument:
 *  root: pointer to struct tree_node
 *
 ***/
{
    if(root == NULL)
    {
        return;
    }

    free(root->str);
    free_tree(root->left);
    free_tree(root->right);
    free(root);

    return;
}

void preorder_traverse(struct tree_node *node)
/***
 * preorder_traverse traverse tree in preorder,
 * which mean that give a tree B<-A->C, the print out order will be:
 * A, C, B
 *
 * Argument:
 *  node: pointer to struct tree_node
 *
 ***/
{
    if(node == NULL)
    {
        return;
    }

    /**This printf just give you an idea how preorder_traverse print out element from tree**/
    printf("%s ", node->str);
    
    /**
     * You will need to modify this part to dump memory of current tree node.
     * Remember, you need dump current node, str, left, right. Think carefully what do you actually need to dump here.
     **/

    preorder_traverse(node->left);
    preorder_traverse(node->right);
}

main() {
    char str[20];
    int a;
    int b;
    double y;
    int int_array[4];
    struct X x;
    char * s;

    printf("str:       %p\n", str);
    printf("&a:        %p\n", &a);
    printf("&b:        %p\n", &b);
    printf("&y:        %p\n", &y);
    printf("&x:        %p\n", &x);
    printf("int_array: %p\n", int_array);
    printf("\n");  

    // memdump before variable assignment
    printf("\n               -----Part 3.1 before variable assignment-----\n\n");
    memdump((char *) &x.a, 96);

    strcpy(str, "Hello World\n");
    a = 5;
    b = -5;
    y = 12.625;
    int_array[0] = 0;
    int_array[1] = 10;
    int_array[2] = 20;
    int_array[3] = 30;
    x.a = 'A';
    x.i = 9;
    x.b = '0';
    x.p = &x.i;

    // memdump after variable assignment
    printf("\n               -----Part 3.1 after variable assignment-----\n\n");
    memdump((char *) &x.a, 96);

    // The following assignments may cause a compiler warning. 'Safely' ignore the warning.
    // However, using *(int_array + n) instead of int_array[n] does not cause a warning.
    int_array[4] = 1685024583;
    int_array[5] = 543521122;
    int_array[6] = 1819438935;
    int_array[7] = 100;
    
    // memdump after buffer overflow
    printf("\n               -----Part 3.1 after buffer overflow-----\n\n");
    memdump((char *) &x.a, 96);

    struct tree_node *root = create_tree_node(NULL, NULL, NULL);
    printf("\n               -----Part 3.2 tree_node before variable assignment-----\n\n");
    memdump((char *) root, 256);

    /* Create the binary tree */
    s = strdup("to");
    struct tree_node *left = create_tree_node(s, NULL, NULL);
    s = strdup("lab8");
    struct tree_node *right = create_tree_node(s, NULL, NULL);
    s = strdup("Welcome");
    root->str = s;
    root->left = left;
    root->right = right;

    printf("\n               -----Part 3.2 tree_node after variable assignment-----\n\n");
    memdump((char *)root, 256);

    free_tree(root);
}
