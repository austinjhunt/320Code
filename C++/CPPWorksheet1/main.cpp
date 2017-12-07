#include <iostream>


void swapFirstTwoElem(int myArray[]){
    int temp = myArray[0];
    myArray[0] = myArray[1];
    myArray[1] = temp;
}

int sumAllElem(int myArray[], int length) {
    int sum = 0;
    for (int i = 0; i < length; i++ ) {
        sum += myArray[i];
    }
    return sum;
}

int * incrementAll(int myArray[],int length) {

    int * myPointer = new int [length] ;
    for (int i = 0 ; i < length; i ++ ) {
        *(myPointer+i) = *(myArray + i) + 1;

    }

    return myPointer; //pointer to first element; stores first element's address
}
//empty array length only allowed on first dimension
int sumAllElem2D(int myArray[][3], int outerLength){

    int sum = 0;
    //for each outer index position
    for (int i = 0 ; i < outerLength; i ++ ) {
        //for each inner index position
        for (int j = 0 ; j < 3; j++ ) {
            //add to sum
            sum += myArray[i][j];
        }
    }
    return sum;

}

int * incrementAll2D(int myArray[][3], int length){

    int * incremented = new int [length*3];
    int k = 0;
    for (int i = 0 ;  i < length; i ++) {
        for (int j = 0; j < 3; j ++ ) {
            *(incremented + k) = myArray[i][j] + 1;
           // std::cout << "incremented[" << k << "] : " << incremented[k] << std::endl;
            k++;
        }
    }
    return incremented;

}


//SINGLY LINKED LIST!
struct SLLnode {
    char* data;
    SLLnode* next;

};

class SinglyLinkedList{
private:
    SLLnode *head;
    SLLnode *tail;

public:
    SinglyLinkedList(){
        head=NULL;tail=NULL;
    }
    void addNode(char* dataArg){
        SLLnode *myNode = new SLLnode;
        myNode->data=dataArg;
        myNode->next=NULL;

        //check if you're adding to empty list
        if (head == NULL) {
            //if so, this node is both head and tail; no longer need myNode pointer
            head = myNode;
            tail = myNode;
            myNode = NULL;
        }
        //if the list is NOT empty, just make the current tail (end)'s "next" point to this node
            //also, now this node is the end, so make that assignment
        else{
            tail->next = myNode;
            tail = myNode;
        }
    }

    void traverseList() {

        SLLnode *myNode = new SLLnode;//create a temporary node; will use to traverse the list, displaying data
        myNode = head; //start at the beginning
        while (myNode != NULL) {
            std::cout << myNode->data << "  ";//print the current node data
            myNode = myNode->next; //go to next node until next node is null

        }
    }

    void prependNode(char* dataValue) {
        //make this node's next point at the head
        SLLnode *myNode = new SLLnode;
        myNode->next = head;
        myNode->data=dataValue;
        //also, now this node is the head
        head = myNode;
    }

    void insertNode(int position, char* dataValue){
        SLLnode * before = new SLLnode;
        SLLnode * current = new SLLnode;
        SLLnode * myNode = new SLLnode;

        current = head;
        for (int i = 1 ; i < position; i ++ )
        {
            //Shifting along to the right
            before = current;
            current = current -> next;

        }
        myNode->data = dataValue; //once you get to position
        before->next = myNode;
        myNode->next = current; //current is confusingly the one right after the one you're technically at now


    }

    void modifyNode(int position, char* newDataValue){
        SLLnode * before = new SLLnode;
        SLLnode * current = new SLLnode;

        current = head;
        for (int i = 1 ; i < position; i ++ )
        {
            //Shifting along to the right
            before = current;
            current = current -> next;

        }//reached position, so now modify
        before->data=newDataValue;
    }

    void deleteFirstNode(){
        //easy, dont have to traverse, just make head the second node but first create temp node so init head can
        //be deleted afterward
        SLLnode * temporary = new SLLnode;
        temporary = head;
        head = head->next;
        delete temporary;
    }
    void deleteLastNode(){
        //have to traverse full list to get to end
        SLLnode * currentNode = new SLLnode;
        SLLnode* previousNode = new SLLnode;
        currentNode=head;
        while (currentNode->next !=NULL){
            previousNode = currentNode;
            currentNode = currentNode->next;
        }//reached the tail node
        //make second to last node the tail
        tail = previousNode;
        //make this new tail's next point to nothing
        tail->next = NULL;
        delete currentNode; //dynamic memory manipulation
    }

    void deleteNode(int position) {
        SLLnode * before = new SLLnode;
        SLLnode * current = new SLLnode;

        current = head;
        for (int i = 1 ; i < position; i ++ )
        {
            //Shifting along to the right
            before = current;
            current = current -> next;

        }//reached position, so now modify

        before->next = current->next; //uhoh, probably should actually delete that node from memory ; FIX THIS

    }

};

/*  MergeSort(arr[], l,  r)
  If r > l
  1. Find the middle point to divide the array into two halves:
  middle m = (l+r)/2
  2. Call mergeSort for first half:
  Call mergeSort(arr, l, m)
  3. Call mergeSort for second half:
  Call mergeSort(arr, m+1, r)
  4. Merge the two halves sorted in step 2 and 3:
  Call merge(arr, l, m, r)*/

//function to merge two sub arrays together
/*void merge(int myArray[], int left, int middle, int right){
    int a, b, c;
    int l = middle - left + 1;
    int r = right - middle;

    //temporary storage
    int leftArray[l], rightArray[r];

    for ( a = 0 ; a < l; a ++ ){
        leftArray[a] = myArray[l + a];
    }
    for (b = 0; b < r; b++)
    { rightArray[b] = myArray[middle + 1+ b];}

    a = 0;
    b = 0;
    c = left;

    while (a < l && b < r)
    {
        if (leftArray[a] <= rightArray[b])
        {
            myArray[c] = leftArray[a];
            a++;
        }
        else
        {
            myArray[c] = rightArray[b];
            b++;
        }
        c++;
    }
    while (a < l)
    {
        myArray[c] = leftArray[a];
        a++;
        c++;
    }

    while (b < r)
    {
        myArray[c] = rightArray[b];
        b++;
        c++;
    }


}*/

void merge(int myArray[], int left, int middle, int right)
{
    int a, b, c;
    int l = middle- left + 1;
    int r =  right - middle;

    int leftArray[l], rightArray[r];


    for (a = 0; a < l; a++)
        leftArray[a] = myArray[l + a];
    for (b = 0; b < r; b++)
        rightArray[b] = myArray[middle + 1+ b];


    a = 0;
    b = 0;
    c = l;
    while (a < l && b < r)
    {
        if (leftArray[a] <= rightArray[b])
        {
            myArray[c] = leftArray[a];
            a++;
        }
        else
        {
            myArray[c] = rightArray[b];
            b++;
        }
        c++;
    }

    /* Copy the remaining elements of L[], if there
       are any */
    while (a < l)
    {
        myArray[c] = leftArray[a];
        a++;
        c++;
    }

    /* Copy the remaining elements of R[], if there
       are any */
    while (b < r)
    {
        myArray[c] = rightArray[b];
        b++;
        c++;
    }
}
void mergesort(int myArray[], int left, int right){

    if (left < right) {
        int middle;
        middle = (left + (right-1)) / 2;
        mergesort(myArray, left, middle);
        mergesort(myArray,middle+1, right);
        merge(myArray, left, middle,right);
    }

}




int main() {
    std::cout << "Swap first two elements in a list (of integers): " << std::endl;
    int myArray[5];
    myArray[0] = 1;
    myArray[1] = 2;
    myArray[2] = 3;
    myArray[3] = 4;
    myArray[4] = 5;
    std::cout << "Initial array order: " << myArray[0] << myArray[1] << myArray[2] << myArray[3] << myArray[4]
              << std::endl;
    swapFirstTwoElem(myArray);
    std::cout << "Post-swap array order: " << myArray[0] << myArray[1] << myArray[2] << myArray[3] << myArray[4]
              << std::endl;
    int mySum = sumAllElem(myArray, 5);
    std::cout << "Sum of elements in above array: " << mySum << std::endl;

    std::cout << "Increment all elements in array: " << std::endl;


    std::cout << "Initial elements: " << std::endl;
    for (int i = 0; i < 5; i++) {
        std::cout << myArray[i] << std::endl;
    }
    int *myPointer;
    myPointer = incrementAll(myArray, 5);


    std::cout << "After incrementing: " << std::endl;

    for (int i = 0; i < 5; i++) {
        std::cout << *(myPointer + i) << std::endl;
    }


    std::cout << "\n\nNow, 2D arrays!" << std::endl;

    std::cout << "new array initialization!" << std::endl;

    int myArray2[5][3];
    //initialize
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 3; j++) {
            myArray2[i][j] = i + j;
            std::cout << "Element [" << i << "][" << j << "] : " << myArray2[i][j] << std::endl;
        }
    }

    int sum2 = sumAllElem2D(myArray2, 5);
    std::cout << "Sum of 2D array is : " << sum2 << std::endl;

    std::cout << "Now increment each element: " << std::endl;


    int *pointerIncremented;
    pointerIncremented = incrementAll2D(myArray2, 5);
    std::cout << "After incrementing: " << std::endl;

    int k = 0;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 3; j++) {
            std::cout << "Element [" << i << "][" << j << "] : " << *(k + pointerIncremented) << std::endl;
            k++;
        }
    }

    SinglyLinkedList *mySLL = new SinglyLinkedList();

    std::cout<<"Singly linked list time"<<std::endl;
    char *myString  = "hello";
    char*myString2 = "how are you";
    char*myString3 = "Singly Linked Lists are cool";
    mySLL->addNode(myString);
    mySLL->prependNode(myString2);
    mySLL->insertNode(1, myString3);
    char*modifiedString = "I like pizza";
    char*myString4 = "another new string";
    char*myString5 = "running out of things to say";
    mySLL->modifyNode(1, modifiedString);
    mySLL->addNode(myString4);
    mySLL->insertNode(2, myString5);
    mySLL->deleteFirstNode();
    mySLL->deleteNode(1);
    mySLL->traverseList();

    std::cout<<"Merge sort time: "<<std::endl;

    int myArrayToSort [10] ;

    std::cout<<"Initial array:" << std::endl;
    for (int i = 0 ; i < 10; i ++) {
        myArrayToSort[i] = i*37%(sizeof(myArrayToSort)/sizeof(int));
        std::cout<< myArrayToSort[i] << "\t";
    }

    mergesort(myArrayToSort, 0,9);
    std::cout<<"\nAfter sorting:"<<std::endl;
    for (int i = 0 ; i < 10; i ++) {
        std::cout<< myArrayToSort[i] << "\t";
    }
}















