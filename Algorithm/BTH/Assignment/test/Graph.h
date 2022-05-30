#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <queue>
using namespace std;

const int init = 100;    //常数，表示路径权重正无穷

struct PQnode
{
    string v;
    string w;
    int weight;
    PQnode(string v,string w,int weight)
        :v(v),w(w),weight(weight){};
};

//利用仿函数构建优先队列，使得队列中永远距离短的先出列
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
    //节点数和边数
    int edgeNum = 0;
    int vertexNum = 0;
    string vertex[100]{};           //存放每个节点字母以及它的下标
    int adjMatrix[100][100];        //存放邻接矩阵
    int visited[100];               //后面用来判断是否是已阅的节点
    string tempPath[100]{};         //后面用来存储每个点距离原点的最近路径的前一点
    string lastV,lastW;

    Graph(/* args */);
    ~Graph();
    void addEdge(string v, string w, int weight);               // Adds edges (v, w, weight)
    int shortestPath(string v, string w);                       // Performs Dijkstra's and returns the path cost
    string showShortestPath();                                   // Returns last performed shortestPath as a string
    void readGraphFromFile(string pathToFile);                  // Reads a graph from a file
    int findIndex(string x);                                    //用来寻找字母对应的下标是多少
    void showMartix();
};

