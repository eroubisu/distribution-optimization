function [V,Theta,Ploss]=Powerflow(Pload,Qload)
V=[ones(32,1);1.05];Theta=zeros(33,1);
G=[21.4943686300000,-2.58137264300000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-5.11502111900000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-13.7979748700000;-2.58137264300000,8.48018383100000,-3.47721018300000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2.42160100500000,0,0,0,0,0,0,0,0,0,0,0;0,-3.47721018300000,6.81657689900000,-3.33936671600000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,-3.33936671600000,4.46071128400000,-1.12134456700000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,-1.12134456700000,8.10810813700000,-0.717862656200000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-6.26890091400000,0,0,0,0,0,0,0,0;0,0,0,0,-0.717862656200000,2.74899529300000,-2.03113263700000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,-2.03113263700000,3.05745447700000,-1.02632184000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,-1.02632184000000,2.04814808600000,-1.02182624600000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,-1.02182624600000,8.37087266200000,-7.34904641600000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,-7.34904641600000,11.2079846800000,-3.85893826600000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,-3.85893826600000,4.53328987500000,-0.674351609300000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,-0.674351609300000,1.75730975500000,-1.08295814500000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,-1.08295814500000,2.59620713200000,-1.51324898700000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,-1.51324898700000,2.91389611100000,-1.40064712400000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,-1.40064712400000,1.84749781100000,-0.446850686600000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.446850686600000,1.72121744600000,-1.27436675900000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1.27436675900000,1.27436675900000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;-5.11502111900000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5.70307629700000,-0.588055178500000,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.588055178500000,2.24312342000000,-1.65506824100000,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1.65506824100000,2.47775884800000,-0.822690607300000,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.822690607300000,0.822690607300000,0,0,0,0,0,0,0,0,0,0,0,0;0,-2.42160100500000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3.52093297500000,-1.09933197000000,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1.09933197000000,2.20881655800000,-1.10948458800000,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1.10948458800000,1.10948458800000,0,0,0,0,0,0,0,0,0;0,0,0,0,-6.26890091400000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10.7474519100000,-4.47855099300000,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-4.47855099300000,5.33007281800000,-0.851521824600000,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.851521824600000,1.98457500900000,-1.13305318400000,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1.13305318400000,3.64061355000000,-2.50756036500000,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2.50756036500000,3.33967096700000,-0.832110601100000,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.832110601100000,3.02074490100000,-2.18863430000000,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2.18863430000000,3.54215431500000,-1.35352001500000,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1.35352001500000,1.35352001500000,0;-13.7979748700000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,13.7979748700000];%节点导纳矩阵实部;
B=[-13.2295494500000,1.31477215100000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4.88110247000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7.03367482600000;1.31477215100000,-4.74033254100000,1.77090704400000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.65465334600000,0,0,0,0,0,0,0,0,0,0,0;0,1.77090704400000,-3.47169707200000,1.70079002800000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,1.70079002800000,-2.66878833000000,0.967998301700000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0.967998301700000,-6.53405809200000,2.37293489100000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3.19312489900000,0,0,0,0,0,0,0,0;0,0,0,0,2.37293489100000,-3.04417369200000,0.671238800900000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0.671238800900000,-1.40859623900000,0.737357438600000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0.737357438600000,-1.46164041000000,0.724282971500000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0.724282971500000,-3.15402873500000,2.42974576300000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,2.42974576300000,-3.70575152500000,1.27600576200000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,1.27600576200000,-1.80657531800000,0.530569556300000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0.530569556300000,-1.95605120700000,1.42548165000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,1.42548165000000,-2.77229885300000,1.34681720300000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,1.34681720300000,-2.36966683800000,1.02284963500000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,1.02284963500000,-1.61945943500000,0.596609799500000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.596609799500000,-2.56297141200000,1.96636161200000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.96636161200000,-1.96636161200000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;4.88110247000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-5.41098545700000,0.529882986900000,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.529882986900000,-2.46342302700000,1.93354004000000,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.93354004000000,-3.02129276500000,1.08775272400000,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.08775272400000,-1.08775272400000,0,0,0,0,0,0,0,0,0,0,0,0;0,1.65465334600000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2.52273385800000,0.868080512000000,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.868080512000000,-1.73622743700000,0.868146924900000,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.868146924900000,-0.868146924900000,0,0,0,0,0,0,0,0,0;0,0,0,0,3.19312489900000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-5.47337236100000,2.28024746200000,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2.28024746200000,-3.03101793200000,0.750770469900000,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.750770469900000,-1.73785957800000,0.987089108300000,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.987089108300000,-2.26433906800000,1.27724996000000,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.27724996000000,-2.09962527700000,0.822375317000000,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.822375317000000,-3.37331494100000,2.55093962400000,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2.55093962400000,-4.67926053900000,2.12832091500000,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2.12832091500000,-2.12832091500000,0;7.03367482600000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-7.03367482600000];%节点导纳矩阵虚部;
P=zeros(32,1);Q=zeros(32,1);H=zeros(32,32);N=zeros(32,32);K=zeros(32,32);L=zeros(32,32);
for t=1:5
    for i=1:32
        P(i)=V(i)*sum(V.*(  (G(i,:)'.*cos(Theta(i)*ones(33,1)-Theta))+(B(i,:)'.*sin(Theta(i)*ones(33,1)-Theta))));
        Q(i)=V(i)*sum(V.*((G(i,:)'.*sin(Theta(i)*ones(33,1)-Theta))-(B(i,:)'.*cos(Theta(i)*ones(33,1)-Theta))));
        for j=1:32
            if i~=j
                H(i,j)=-V(i)*V(j)*(G(i,j)*sin(Theta(i)-Theta(j))-B(i,j)*cos(Theta(i)-Theta(j)));
                N(i,j)=-V(i)*V(j)*(G(i,j)*cos(Theta(i)-Theta(j))+B(i,j)*sin(Theta(i)-Theta(j)));
                K(i,j)=V(i)*V(j)*(G(i,j)*cos(Theta(i)-Theta(j))+B(i,j)*sin(Theta(i)-Theta(j)));
                L(i,j)=-V(i)*V(j)*(G(i,j)*sin(Theta(i)-Theta(j))-B(i,j)*cos(Theta(i)-Theta(j)));
            else
                H(i,i)=V(i)^2*B(i,i)+Q(i);
                N(i,i)=-V(i)^2*G(i,i)-P(i);
                K(i,i)=V(i)^2*G(i,i)-P(i);
                L(i,i)=V(i)^2*B(i,i)-Q(i);
            end
        end
    end
    J=[H,N;K,L];deltaP=-Pload-P;deltaQ=-Qload-Q;deltaW=[deltaP;deltaQ];Volta=diag(V(1:32));
    delta=-J^(-1)*deltaW;deltaTheta=delta(1:32);deltaV=delta(33:64);deltaV=Volta*deltaV;
    V=V+[deltaV;0];Theta=Theta+[deltaTheta;0];
end
Ploss=0;
for i=1:33
    for j=1:33
        if G(i,j)~=0
            Ploss=Ploss+0.5*abs(G(i,j)*(V(i,1)*V(i,1)+V(j,1)*V(j,1)-2*V(i,1)*V(j,1)*(1-(Theta(i,1)-Theta(j,1))^2/2)));
        end       
    end
end
end

            