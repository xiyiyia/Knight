#ifndef GRAPHLNK_H
#define GRAPHLNK_H
#include "Graph.h"

template<class T,class E>
class Graphlnk : public Graph<T,E>
{
private:
	Vertex<T, E> * NodeTable;
	int getVertexPos(const T vertex)
	{
		for (int i = 0; i< numVertices; i++)
			if (NodeTable[i].data == vertex)
				return i;
		return -1;
	}
public:
	Graphlnk(int sz = DeafultVertices);
	~Graphlnk();
	T getValue(int i)			
	{
		return (i>=0 && i< numVertices)? NodeTable[i].data:0;
	}
	E getWeight(int v1,int v2);
	int getRouter(int i) {
		int j;
		for (j = 0; j < numVertices; j++) { 
			if (NodeTable[j].data == i) { break; } 
		}
		return j;
	}
	bool insertVertex(const T vertex);
	bool insertEdge(int v1, int v2,E cost);
	int NumberOfVertices()
	{
		return this->numVertices;
	}
	void ShortestPath(Graph<T, E>& G, int v, E dist[], int path[]);
	void printPath(Graph<T, E>& G, int v, E dist[], int path[]);
};

#endif