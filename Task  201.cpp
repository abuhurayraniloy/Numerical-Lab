#include<bits/stdc++.h>
using namespace std;
int main(){
    int n=3;
    cout.precision(3);
    float mat[n][n+1] = { {25,5,1,106.8}, {64,8,1,177.2},{144,12,1,279.2} };
    float ans[n];

    //Pivotisation
    for (int i=0;i<n;i++){
        for (int k=i+1;k<n;k++){
            if (abs(mat[i][i])<abs(mat[k][i])){
                for (int j=0;j<=n;j++)
                {
                    double temp=mat[i][j];
                    mat[i][j]=mat[k][j];
                    mat[k][j]=temp;
                }
            }
        }
    }

    //forward-substituiton
    for(int i=0;i<n-1;i++){
        for(int k=i+1;k<n;k++){
            double t = mat[k][i]/mat[i][i];
            for(int j=0;j<=n;j++){
                mat[k][j] = mat[k][j] - t * mat[i][j];
            }
        }
    }

    //back-substituiton
    for (int i=n-1;i>=0;i--)
    {
        ans[i]=mat[i][n];
        for (int j=i+1;j<n;j++)
            if (j!=i)
                ans[i]=ans[i]-mat[i][j]*ans[j];
        ans[i]=ans[i]/mat[i][i];
    }
    cout<<"Ans no 1 :\n";
    for(int i=0;i<n;i++) printf("a%d\t =\t%.2lf\n",i+1,ans[i]);

    cout<<"Ans no 2 :\n";
    double v = ans[0]*6*6 + ans[1]*6 + ans[2];
    printf("velocity at t=6 second : v = %.2lf",v);



}