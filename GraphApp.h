#ifndef GRAPHAPP_H
#define GRAPHAPP_H
#include "Graphlnk.h"
const int maxValue = 30;

template<class T,class E>
void ShortestPath(Graph<T, E>& G, int v, E dist[], int path[]){
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
			if (S[j] == false&&dist[j] < min) { u = j; min = dist[j]; }
		}
		S[u] = true;
		for (k = 0; k < n; k++) {
			w = G.getWeight(u, k);
			if (S[k]==false&&w < maxValue&&dist[u] + w < dist[k]) {
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
	for (i = 0; i<n-1; i++)
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
			cout <<"     "<< G.getValue(d[0]) << "           " << G.getValue(d[--k]) << "            " << dist[i] << endl;
		}
	}
	delete[] d;
}

#endif