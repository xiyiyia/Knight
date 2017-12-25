#ifndef GRAPH_H
#define GRAPH_H
const int maxWeight = 30;
const int DeafultVertices = 30;		
template<class T,class E>
struct Edge
{
	int dest;		
	E cost;			
	Edge<T,E> * link;	
	Edge(){cost = maxWeight;}
	Edge(int num,E weight) : dest(num),cost(weight),link(NULL){}
	bool operator != (Edge<T,E>& R)const
	{
		return (dest != R.dest) ? true : false;
	}
};
template<class T,class E>
struct Vertex
{
	T data;			
	Edge<T,E> *adj;		
};
template<class T,class E>
class Graph 
{
protected:
	int maxVertices;
	int numEdges;
	int numVertices;
	int getVertexPos(T vertex);
public:
	Graph(int sz = DeafultVertices){};
	~Graph(){}
	bool GraphEmpty()const
	{
		if(numEdges == 0 )
			return true;
		else
		{
			return false;
		}
	}
	bool GraphFull()const
	{
		if(numVertices == maxVertices || numEdges == maxVertices * (maxVertices -1 )/2)
			return true;
		else return false;
	}
	int NumberOfVertices(){ return numVertices;}	
	int NunberOfEdges() { return numEdges; }			
	virtual T getValue(int i ) = 0;						
	virtual E getWeight(int v1,int v2) = 0;				
	virtual bool insertVertex(const T vertex) = 0;		
	virtual bool insertEdge(int v1, int v2,E cost) = 0;		
};
#endif