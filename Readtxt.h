#ifndef READTXT_H_
#define READTXT_H_
#include"data.h"
#include<vector>
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
};
#endif // READTXT_H_
