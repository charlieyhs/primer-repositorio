/*El usuario introduce tres n�meros enteros y el programa los ordenar� en orden ascendente y 
a continuaci�n en orden descendente, mostrando en la primer columna los n�meros de menor a mayor 
y en la siguiente columna a continuaci�n los n�meros de mayor a menor.*/
#include<iostream>
#include<conio.h>
using namespace std;


int main(){
	int vector[3];
	int aux;
	for(int i=0;i<3;i++){
		cout<<"digite el numero ["<<i<<"]: ";
		cin>>vector[i];
	}
	for(int i=0;i<3;i++){
		for(int j=0;j<3;j++){
			if(vector[j]>vector[j+1]){
				aux = vector[j];
				vector[j] = vector[j+1];
				vector[j+1] = aux;
			}
		}
	}
	cout<<"\n\nLOS NUMERO ORDENADOS DE MENOR A MAYOR SON: "<<endl;
	for(int i=1;i<=3;i++){
		cout<<"\t"<<vector[i]<<endl;
	}
	cout<<"\n\nLOS NUMERO ORDENADOS DE MAYOR A MENOR SON: "<<endl;
	for(int i=3;i>0;i--){
		cout<<"\t"<<vector[i]<<endl;
	}
	cout<<"chupelo git y github"<<endl;
	for (int i = 0;i<5;i++){
		cout<<"Charlie"<<endl;
	}
	getch();
	return 0;
}

