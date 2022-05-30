#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <queue>
using namespace std;

const int init = 100;    //��������ʾ·��Ȩ��������

struct PQnode
{
    string v;
    string w;
    int weight;
    PQnode(string v,string w,int weight)
        :v(v),w(w),weight(weight){};
};

//���÷º����������ȶ��У�ʹ�ö�������Զ����̵��ȳ���
struct cmp{
    bool operator ()(PQnode a,PQnode b){
        return a.weight >b.weight;
    }
};
priority_queue<PQnode , vector<PQnode> , cmp >PQ;

class Graph
{
private:
    
public:
    //�ڵ����ͱ���
    int edgeNum = 0;
    int vertexNum = 0;
    string vertex[100]{};           //���ÿ���ڵ���ĸ�Լ������±�
    int adjMatrix[100][100];        //����ڽӾ���
    int visited[100];               //���������ж��Ƿ������ĵĽڵ�
    string tempPath[100]{};         //���������洢ÿ�������ԭ������·����ǰһ��
    string lastV,lastW;

    Graph(/* args */);
    ~Graph();
    void addEdge(string v, string w, int weight);               // Adds edges (v, w, weight)
    int shortestPath(string v, string w);                       // Performs Dijkstra's and returns the path cost
    string showShortestPath();                                   // Returns last performed shortestPath as a string
    void readGraphFromFile(string pathToFile);                  // Reads a graph from a file
    int findIndex(string x);                                    //����Ѱ����ĸ��Ӧ���±��Ƕ���
    void showMartix();
};

