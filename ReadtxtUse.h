#ifndef READTXTUSE_H_
#define READTXTUSE_H_
#include<iostream>
#include<fstream>
#include<string>
#include"Readtxt.h"
#include"GraphApp.h"
void Readtxt::Read() {
	int a1, a2, a3;
	Router R;
	Path P;
	ifstream ifile1, ifile2;
	ifile1.open("Router.txt");
	if (!ifile1) { cout << "无法打开文本" << endl; exit(1); }
	while (ifile1.eof() != 1) {
		ifile1 >> a1;
		R.number = a1;
		Rou.push_back(R);
	}
	ifile1.close();
	ifile2.open("Path.txt");
	if (!ifile2) { cout << "无法打开文本" << endl; exit(1); }
	while (ifile2.eof() != 1) {
		ifile2 >> a1 >> a2 >> a3;
		P.start = a1;
		P.end = a2;
		P.path = a3;
		Pat.push_back(P);
	} 
	ifile2.close();
}
void Readtxt::Shortest() {
	Graphlnk<int, int> Gra;
	int a[2025];
	int b[2025];
	int c[2025];
	int d[2025];
	int a1[2025];//
	int b1[2025];//
	int e, D;
	int*distance = new int[2025];
	int *path = new int[2025];
	for (int j = 0; j < (int)Rou.size(); j++) {/******************************************/
		a[j] = Rou[j].number;
		Gra.insertVertex(a[j]);
	}
	for (int i = 0; i < (int)Pat.size(); i++) {
		d[i] = Pat[i].start;
		b[i] = Pat[i].end;
		c[i] = Pat[i].path;
		a1[i]=Gra.getRouter(d[i]);
		b1[i] = Gra.getRouter(b[i]);
		Gra.insertEdge(a1[i], b1[i], c[i]);
	}
	cout << "输入你需要查找的路由器的路由表：";
	cin >> e;
	D=Gra.getRouter(e);
	ShortestPath(Gra, D, distance, path);
}
void Readtxt::Add() {
	int a1, a2, b1;
	ofstream ifile1, ifile2;
	ifile1.open("Router.txt",ios::app);
	if (!ifile1) { cout << "无法打开文本" << endl; exit(1); }
	cout << "输入你需要添加的路由器：";
	cin >> a1;
	ifile1 <<  a1 << endl;
	ifile1.close();
	ifile2.open("Path.txt",ios::app);
	if (!ifile2) { cout << "无法打开文本" << endl; exit(1); }
	while (1) {
		cout << "输入该路由器可直达的路由器，及其权值（输入100 0 0退出）：";
		cin >> a1 >> a2 >> b1;
		if (a1 == 100) { break; }
		ifile2 << a1 << " " << a2 << " " << b1 << " " << endl;
	}
	ifile2.close();
}
void Readtxt::DeleteRouter() {
	int a1;
	int a[2025];
	int b[2025];
	int c[2025];
	int d[2025];
	ofstream ifile1, ifile2;
	cout << "输入你要删除的路由器：";
	cin >> a1;
	ifile1.open("Router.txt");
	if (!ifile1) { cout << "无法打开文本" << endl; exit(1); }
	for (int j = 0; j < (int)Rou.size()-1; j++) {
		d[j] = Rou[j].number;
		if (d[j] == a1) { continue; }
		ifile1 <<d[j] << endl;
	}
	ifile1.close();
	ifile2.open("Path.txt");
	if (!ifile2) { cout << "无法打开文本" << endl; exit(1); }
	for (int i = 0; i < (int)Pat.size()-1; i++) {
		a[i] = Pat[i].start;
		b[i] = Pat[i].end;
		c[i] = Pat[i].path;
		if (a[i] == a1 || b[i] == a1) { continue; }
		ifile2 << a[i] << " " << b[i] << " " << c[i] << endl;
	}
	ifile2.close();
}
void Readtxt::DeletePath() {
	int a1, a2;
	int a[2025];
	int b[2025];
	int c[2025];
	ofstream ifile1;
	cout << "输入你要删除的线路的两个路由：";
	cin >> a1 >> a2;
	ifile1.open("Path.txt");
	if (!ifile1) { cout << "无法打开文本" << endl; exit(1); }
	for (int i = 0; i < (int)Pat.size()-1; i++) {
		a[i] = Pat[i].start;
		b[i] = Pat[i].end;
		c[i] = Pat[i].path;
		if (a[i] == a1&&b[i] == a2) { continue; }
		if(a[i] == a2&&b[i] == a1) { continue; }
		ifile1 << a[i] << " " << b[i] << " " << c[i] << endl;
	}
	ifile1.close();
}
void Readtxt::Out() {
	Rou.erase(Rou.begin(),Rou.end()); Pat.erase(Pat.begin(),Pat.end());
	return;
}
#endif#endif
#endif

//////////////////////////////*//////////////////////////////////////