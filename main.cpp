#include"Readtxt.h"
int main() {
	Readtxt Rea;
	int i;
	while (1) {
		cout << "*******************************************" << endl;
		cout << "1.查询路由表" << endl;
		cout << "2.新增路由器" << endl;
		cout << "3.删除路由器" << endl;
		cout << "4.删除一条路由器线路" << endl;
		cout << "5.退出" << endl;
		cout << "*******************************************" << endl;
		cout << "输入你的选择：";
		cin >> i;
		Rea.Read();
		switch (i){
		case 1:Rea.Shortest(); continue;
		case 2:Rea.Add(); continue;
		case 3:Rea.DeleteRouter(); continue;
		case 4:Rea.DeletePath(); continue;
		case 5:break;
		default:
			break;
		}
	}
	system("pause");
	return 0;
}