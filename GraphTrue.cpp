#include"Graphlnk.h"
template<class T, class E>
inline Graphlnk<T, E>::Graphlnk(int sz) {
	maxVertices = sz;
	numVertices = 0;
	numEdges = 0;
	NodeTable = new Vertex<T, E>[maxVertices];
	if (NodeTable == NULL) { cerr << "存储分配错误！" << endl; exit(1); }
	for (int i = 0; i<maxVertices; i++)NodeTable[i].adj = NULL;
}
template<class T, class E>
inline Graphlnk<T, E>::~Graphlnk()
{
	for (int i = 0; i<maxVertices; i++)
	{
		Edge<T, E> * p = NodeTable[i].adj;
		while (p != NULL)
		{
			NodeTable[i].adj = p->link;
			delete p;
			p = NodeTable[i].adj;
		}
	}
	delete[] NodeTable;
}
template<class T, class E>
inline E Graphlnk<T, E>::getWeight(int v1, int v2)
{
	if (v1 != -1 && v2 != -1)
	{
		Edge<T, E> *p = NodeTable[v1].adj;
		while (p != NULL && p->dest != v2) { p = p->link; }
		if (p != NULL) return p->cost;
		Edge<T, E> *q = NodeTable[v2].adj;
		while (q != NULL&&q->dest != v1) { q = q->link; }
		if (q != NULL)return q->cost;
		return maxWeight;
	}
}
template<class T, class E>
inline bool Graphlnk<T, E>::insertVertex(const T vertex)
{
	if (numVertices == maxVertices) return false;
	NodeTable[numVertices].data = vertex;
	numVertices++;
	return true;
}

template<class T, class E>
inline bool Graphlnk<T, E>::insertEdge(int v1, int v2, E cost)
{
	if (v1 >= 0 && v1< numVertices && v2 >= 0 && v2<numVertices)
	{
		Edge<T, E> *q = NodeTable[v2].adj;
		Edge<T, E>  *p = NodeTable[v1].adj;
		while (p != NULL && p->dest != v2)
		{
			p = p->link;
		}
		if (p != NULL) return false;
		while (q != NULL && q->dest != v1)
		{
			q = q->link;
		}
		if (q != NULL) return false;
		p = new Edge<T, E>;
		q = new Edge<T, E>;
		p->dest = v2;
		p->cost = cost;
		p->link = NodeTable[v1].adj;
		NodeTable[v1].adj = p;
		q->dest = v1;
		q->cost = cost;
		q->link = NodeTable[v2].adj;
		NodeTable[v2].adj = q;
		numEdges++;
		return true;
	}
	return false;
}

template<class T, class E>
inline void Graphlnk<T, E>::ShortestPath(Graph<T, E>& G, int v, E dist[], int path[]) {
	int n = G.NumberOfVertices();
	bool * S = new bool[n];
	E w, min;
	int i, j, k;
	for (i = 0; i < n; i++) {
		dist[i] = G.getWeight(v, i);
		S[i] = false;
		if (i != v&&dist[i] < maxValue) { path[i] = v; }
		else path[i] = -1;
	}
	S[v] = true; dist[v] = 0;
	for (i = 0; i < n; i++) {
		min = maxValue; int u = v;
		for (j = 0; j < n; j++) {
			if (S[j] == false && dist[j] < min) { u = j; min = dist[j]; }
		}
		S[u] = true;
		for (k = 0; k < n; k++) {
			w = G.getWeight(u, k);
			if (S[k] == false && w < maxValue&&dist[u] + w < dist[k]) {
				dist[k] = dist[u] + w;
				path[k] = u;
			}
		}
	}
	printPath(G, v, dist, path);
}
template<class T, class E>
inline void Graphlnk<T, E>::printPath(Graph<T, E>& G, int v, E dist[], int path[])
{
	cout << "路由器" << G.getValue(v) << "的路由表为：" << endl;
	int i, j, k, n = G.NumberOfVertices();
	int * d = new int[n];
	for (i = 0; i<n - 1; i++)
	{
		if (i != v)
		{
			j = i;
			k = 0;
			while (j != v)
			{
				d[k++] = j;
				j = path[j];
			}
			cout << "目的路由     " << "下一跳路由    " << "权值" << endl;
			cout << "     " << G.getValue(d[0]) << "           " << G.getValue(d[--k]) << "            " << dist[i] << endl;
		}
	}
	delete[] d;
}