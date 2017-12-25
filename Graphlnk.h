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
};
template<class T,class E>
Graphlnk<T,E>::Graphlnk(int sz )
{
	maxVertices = sz;
	numVertices = 0;
	numEdges = 0;
	NodeTable = new Vertex<T, E>[maxVertices];    
	if (NodeTable == NULL) { cerr << "´æ´¢·ÖÅä´íÎó£¡" << endl; exit(1); }
	for(int i = 0;i<maxVertices;i++)NodeTable[i].adj =NULL;
}
template<class T,class E>
Graphlnk<T,E>::~Graphlnk()
{
	for(int i = 0;i<maxVertices;i++)
	{
		Edge<T,E> * p = NodeTable[i].adj;
		while (p != NULL)
		{
			NodeTable[i].adj = p->link;
			delete p;
			p = NodeTable[i].adj;
		}
	}
	delete[] NodeTable;
}

template<class T,class E>
E Graphlnk<T,E>::getWeight(int v1,int v2)
{
	if( v1 != -1 && v2 != -1)
	{
		Edge<T,E> *p = NodeTable[v1].adj;
		while (p!= NULL && p->dest != v2){p = p->link;}
		if(p != NULL) return p->cost;
		Edge<T, E> *q = NodeTable[v2].adj;
		while (q != NULL&&q->dest != v1) { q = q->link; }
		if (q != NULL)return q->cost;
		return maxWeight;
	}
}
template<class T,class E>
bool Graphlnk<T,E>::insertVertex(const T vertex)
{
	if(numVertices == maxVertices) return false;
	NodeTable[numVertices].data = vertex;
	numVertices++;
	return true;
}

template<class T,class E>
bool Graphlnk<T,E>::insertEdge(int v1, int v2,E cost)
{
	if(v1 >=0 && v1< numVertices && v2>=0 && v2<numVertices)
	{
		Edge<T, E> *q = NodeTable[v2].adj;  
		Edge<T,E>  *p = NodeTable[v1].adj;
		while (p!=NULL && p->dest != v2)
		{
			p = p->link;
		}
		if(p != NULL ) return false;
		while (q != NULL && q->dest != v1)
		{
			q = q->link;
		}
		if (q != NULL) return false;
		p = new Edge<T,E>;
		q = new Edge<T,E>;
		p->dest = v2;
		p->cost = cost;
		p->link = NodeTable[v1].adj;
		NodeTable[v1].adj = p;
		q ->dest = v1;
		q ->cost = cost;
		q->link = NodeTable[v2].adj;
		NodeTable[v2].adj = q;
		numEdges ++;
		return true;
	}
	return false;
}

#endif