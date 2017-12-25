#ifndef READTXT_H_
#define READTXT_H_
#include<vector>
#include"data.h"
class Readtxt {
private:
	vector<Router>Rou;
	vector<Path>Pat;
public:
	void Read();
	void Shortest();
	void Add();
	void DeleteRouter();
	void DeletePath();
	void Out();
};
#endif // READTXT_H_
