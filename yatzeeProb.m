function yatzeeProb
	disp('Expected value when rolling for 1')
	disp(expectedVal([1,0,0,0,0,0],[0;1;2;3;4;5],NumberM(),3))
	disp('Expected value when rolling for a Yatzee')
	disp(expectedVal([1,0,0,0,0],[0;0;0;0;50],YatzeeM(),3))
	disp('Expected value when rolling for a Full House')
	disp(expectedVal([1,0,0,0,0,0],[0;0;0;0;0;25],FullHouseM(),3))
end

function num = expectedVal(in,vals,Mat,times)
	%{
	Params:
	in: row vector of the odds going in
	vals: value in terms of points for the vector coming out column
	Mat: Probability distribution matrix
	times: number of rolls left
	%}
	Mat = Mat ^ times;
	num = in*Mat*vals;
end

function out = YatzeeM
	D=diag([6^5,6^4,6^3,6^2,6^1]);
	P=[
		720,5400,1500,150,6;
		0,720,480,90,6;
		0,0,150,60,6;
		0,0,0,30,6;
		0,0,0,0,6
	];
	out = D^-1*P;
end

function out = NumberM
	D=diag([6^5,6^4,6^3,6^2,6^1,6^0]);
	P=[
		3125,3125,1250,250,25,1;
		0,625,500,150,20,1;
		0,0,125,75,15,1;
		0,0,0,25,10,1;
		0,0,0,0,5,1;
		0,0,0,0,0,1
	];
	out = D^-1*P;
end

function out = FullHouseM
	D=diag([6^5,6^2,6^2,6^1,6^1,6^0]);
	P=[
		720,3600,6,1350,1800,300;
		0,12,0,4,8,2;
		0,0,1,30,0,5;
		0,0,0,5,0,1;
		0,0,0,0,4,2;
		0,0,0,0,0,1;
	];
	out = D^-1*P;
end