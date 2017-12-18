#ifndef GRAPHAPP_H
#define GRAPHAPP_H
#include "Graphlnk.h"
const int maxValue = 1000;
/*void  List(Graph<T, E>&G, T v, E dist[], int quan[]) {
	int n = G.NumberOfVertices();
	bool * S = new boool[n];
	E w, min;
	for (int i = 0, i < n; i++) {
		dist[i] = G.getWeight(v, i);
		S[i] = false;
		if (i != v&&dist[i] < maxValue)path[i] = v;
		else path[i] = -1;
	}
	S[v] = true; dist[v] = 0;
	for (i = 0; i < n - 1; i++) {
		min = maxValue; int u = v;
		for (int j = 0; j < n; j++) {
			if (S[j] == flase&&dist[j] < min) { u = j; min = dist[j]; }
		}
		s[u] = true;
		for (int k = 0; k < n; k++) {
			w = G.getWeight(u, k);
			if (S[k] == flase&&w < maxValue&&dist[u] + w < dist[k]) {
				dist[k] = dist[u] + w;
				path[k] = u;
			}
		}
	}
}*/

template<class T, class E >
void ShortestPath(Graph<T, E>& G, int v, E dist[], int path[])
{
	int n = G.NumberOfVertices();
	bool *S = new bool[n];
	int i, j, k;
	E w, min;
	for (i = 0; i<n; i++)
	{
		dist[i] = G.getWeight(v, i);
		S[i] = false;
		if (i != v && dist[i] <maxValue)
			path[i] = v;
		else
		{
			path[i] = -1;
		}
	}
	S[v] = true;
	dist[v] = 0;
	for (i = 0; i<n - 1; i++)
	{
		min = maxValue;
		int u = v;
		for (j = 0; j<n; j++)
		{
			if (S[j] == false && dist[j] < min)
			{
				u = j;
				min = dist[j];
			}
		}
		S[u] = true;
		for (k = 0; k<n; k++)
		{
			w = G.getWeight(u, k);
			if (S[k] == false && w <maxValue && dist[u] + w<dist[k])
			{
				dist[k] = dist[u] + w;
				path[k] = u;
			}
		}
	}
	printPath(G, v, dist, path);
}

template<class T, class E>
void printPath(Graph<T, E>& G, int v, E dist[], int path[])
{
	cout << "路由器" << G.getValue(v) << "的路由表为：" << endl;
	int i, j, k, n = G.NumberOfVertices();
	int * d = new int[n];
	cout << "目的路由" << "    " << "下一跳" << "    " << "最短权值" << endl;
	for (i = 0; i<n; i++)
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
			cout << G.getValue(d[0]) << "    " << G.getValue(d[--k]) << "    " << dist[i] << endl;
		}
	}
	delete[] d;
}
#endif
